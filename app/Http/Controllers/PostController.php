<?php


namespace App\Http\Controllers;


use App\Http\Models\ImageForPost;
use App\Http\Models\Post;
use App\Http\Models\Tag;
use App\Http\Services\CommentService;
use App\Http\Services\ImageForPostService;
use App\Http\Services\ImageForUserService;
use App\Http\Services\PostService;
use App\Http\Services\UserService;
use App\Http\Validators\PostValidator;
use App\User;
use App\Utilities\S3Helper;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;


class PostController extends Controller
{
    private $postService;
    private $commentService;
    private $imageForUserService;
    private $imageForPostService;
    private $userService;

    public function __construct(
        PostService $postService,
        CommentService $commentService,
        ImageForUserService $imageForUserService,
        ImageForPostService $imageForPostService,
        UserService $userService
    )
    {
        $this->postService = $postService;
        $this->commentService = $commentService;
        $this->imageForUserService = $imageForUserService;
        $this->imageForPostService = $imageForPostService;
        $this->userService = $userService;
    }

    public
    function testDio(Request $request)
    {
        $flag = true;
        if (($request->file('files')) == null) {
            return Response::json([
                'message' => 'No image ',
            ], 200);
        }

        $count = -1;
        if ($files = $request->file('files')) {
            // loop through image array
            foreach ($files as $file) {
                $count++;
                if (S3Helper::S3UploadFile($file, (string)Str::uuid()) == false) {
                    $flag = false;
                    break;
                }
            }
        }

        if ($flag) {
            return Response::json([
                'message' => 'Image upload success',
                'files' => $request->file('files'),
                'countFile' => $count,
            ], 200);
        } else {
            return Response::json([
                'message' => 'Image upload failed',
            ], 400);
        }
    }

    //????NG B??I POST
    public
    function submitPost(Request $request)
    {
        $validator = PostValidator::validateSubmitPost($request);
        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => $validator->errors(),
            ], 200);
        }
        //if ($request->file('images_for_post') != null) {
        if ($request->file('files') != null) {
            return $this->submitPostWithImage($request);
        } else {
            return $this->submitPostWithoutImage($request);
        }
    }

    public
    function submitPostWithImage(Request $request)
    {
        DB::beginTransaction();

        // validate the image
        $validator = PostValidator::validateImage($request);
        // if validate fail
        if ($validator->fails()) {
            DB::rollBack();
            return Response::json([
                'error' => $validator->getMessageBag()->toArray(),
            ], 400);
        }

        $post = new Post();
        //fields handle
        $tag = Tag::find(-1);
        $post->title = $request->get('title');
        $post->content = $request->get('content');
        $post->user_id = $request->get('user_id');
        $post->audience = $request->get('audience');
        $post->save();
        //tag field handle
        $post->tags()->attach($tag);
        $post->tags()->attach($request->get('tag_ids'));
        // image for post handle
        // handle multiple images
        $uploadIsErrorFlag = false;
        if ($files = $request->file('files')) {
            // loop through image array
            foreach ($files as $file) {
                //$result = $this->imageForPostHandleToStorage($post, $file);
                $result = $this->imageForPostHandleToS3($post, $file);
                // if upload file to s3 successful
                if ($result == true) {
                    $uploadIsErrorFlag = true;
                } // if fail, break the loop
                else {
                    $uploadIsErrorFlag = false;
                    break;
                }
            }
            // if there is no error happens, then return successful
            if ($uploadIsErrorFlag == true) {
                $post->update();
                DB::commit();
                return Response::json([
                    'message' => 'Post submit with image successfully',
                    'post_id' => $post->id,
                    'status' => true,
                ], 200);
            } // if there is error, return fail
            else {
                DB::rollBack();
                return Response::json([
                    'message' => 'Image upload failed',
                    'status' => false,
                ], 400);
            }
        }
        return null;
    }

    public
    function submitPostWithoutImage(Request $request)
    {
        DB::beginTransaction();

        $post = new Post();
        //fields handle
        $tag = Tag::find(-1);
        $post->title = $request->get('title');
        $post->content = $request->get('content');
        $post->user_id = $request->get('user_id');
        $post->audience = $request->get('audience');
        $post->save();
        //tag field handle
        $post->tags()->attach($tag);
        $post->tags()->attach($request->get('tag_ids'));

        DB::commit();
        return Response::json([
            'status' => true,
            'message' => 'Post without image submit successfully',
            'post_id' => $post->id,
        ], 200);
    }

    public
    function imageForPostHandleToS3($post, $file)
    {
        $fileName = (string)Str::uuid() . $file->getClientOriginalName();

        // if upload succeeded
        if (S3Helper::S3UploadFile($file, $fileName) == true) {
            $imageForPost = new ImageForPost();
            $imageLink = 'https://caycanhapi.s3.ap-southeast-1.amazonaws.com/' . $fileName;
            $imageForPost->url = $imageLink;
            $imageForPost->post()->associate($post);
            $imageForPost->save();
            return true;
        } // if upload failed
        else {
            return false;
        }
    }

    public
    function imageForPostHandleToStorage($post, $file)
    {
        // change new name
        $fileName = (string)Str::uuid() . $file->getClientOriginalName();
        // upload the image to local storage
        $this->uploadImageToStorage($file, $fileName);
        // create new image for post object and associate it with post object
        $imageForPost = new ImageForPost();
        $imageLink = '/storage/image_for_post/' . $fileName;
        $imageForPost->url = $imageLink;
        $imageForPost->post()->associate($post);
        $imageForPost->save();
        return true;

    }

    // L???Y CHI TI???T B??I VI???T THEO ID
    public
    function getPostById(Request $request)
    {
        $id = $request->get('id');

//        $post = Post::find($id)->with(array('tags' => function ($q) {
//            $q->select('name', 'id')
//                ->where('id', '!=', -1);
//        }))->get();

        $post = Post::find($id);

        //N???U KH??NG T??M ??C POST
        if ($post == null) {
            return Response::json([
                'message' => 'no post is found',
            ], 400);
        }

        $imagesForPost = $post->imagesForPost;

        // handle images for post dynamic url
        foreach ($imagesForPost as $image) {
            $image->dynamic_url = asset($image->url);
        }
        $tags = $post->tags;
        $user = $post->user;

        // COMMENTS NUMBER
        $commentsNumber = $this->commentService->getNumberOfComments($post->id);
        // avatar for user of the post
        $avatar_url = $this->imageForUserService->getAvatarUrl($post->user->id);
        if ($avatar_url != '' && $avatar_url != null)
            $post->user->avatar_url = asset($avatar_url->url);
        else $post->user->avatar_url = '';

        // CHECK LIKED POST OR NOT
        $userId = $post->user->id;
        $postId = $post->id;
        $post->is_liked = $this->postService->checkLikedPost($userId, $postId);

        return Response::json([
            //'post2' => $postTest,
            'post' => $post,
            'images_for_post' => $imagesForPost,
            'tags' => $tags,
            'user' => $user,
            'comments_number' => $commentsNumber,
        ], 200);

    }

    // L???Y DS B??I VI???T C???A USER CHO TRANG PROFILE THEO C???M
    public
    function getUserPosts(Request $request)
    {
        $userId = $request->get('user_id');
        $currentUserId = $request->get('current_user_id');
        $skip = $request->get('skip');
        $take = $request->get('take');

        // N???u user ??ang xem t?????ng ch??nh m??nh, cho th???y h???t
        // N???u user ??ang xem t?????ng user kh??c, x??t theo role ????? th???y
        $userId == $currentUserId ? $audience = [1, 2] : $audience = $this->postService->getPostAudienceFromUserId($currentUserId);

        $posts = $this->postService->getUserPosts($audience, $userId, $skip, $take);

        foreach ($posts as $post) {
            // get first image for post
            $first_image_for_post = $this->imageForPostService->getFirstImageForPostByPostId($post->id);

            if ($first_image_for_post != null)
                $post->image_url = asset($first_image_for_post->url);
            else $post->image_url = '';

            // get comments number
            $commentsNumber = $this->commentService->getNumberOfComments($post->id);

            $post->comments_number = $commentsNumber;
        }

        foreach ($posts as $post) {
            $post->short_content .= '...';
        };
        return Response::json([
            //'post2' => $postTest,
            'posts' => $posts,

        ], 200);
    }

    // L???Y DS B??I VI???T C?? TAG TRAO ?????I C??Y C???A USER THEO C???M
    public
    function getUserExchangePosts(Request $request)
    {
        $userId = $request->get('user_id');
        $skip = $request->get('skip');
        $take = $request->get('take');

        $posts = Post::select('id', 'title', 'created_at', 'like', DB::raw('SUBSTRING(content, 1, 70) AS short_content'))
            ->where('user_id', '=', $userId)
            ->whereHas('tags', function ($query) {
                    $query->whereIn('tag_type_id', [4]);
                })
            ->orderBy('created_at', 'DESC')
            ->skip($skip)
            ->take($take)
            ->get();

        foreach ($posts as $post) {
            $post->tags;
            // get first image for post
            $first_image_for_post = $this->imageForPostService->getFirstImageForPostByPostId($post->id);

            if ($first_image_for_post != null)
                $post->image_url = asset($first_image_for_post->url);
            else $post->image_url = '';

            // get comments number
            $commentsNumber = $this->commentService->getNumberOfComments($post->id);

            $post->comments_number = $commentsNumber;
        }

        foreach ($posts as $post) {
            $post->short_content .= '...';
        };
        return Response::json([
            'posts' => $posts,
        ], 200);
    }

    // L???Y DS C??Y MU???N TRAO ?????I CHO B??I VI???T
    public
    function getUserPlantsForPost(Request $request) {
        $postId = $request->get('post_id');
        $skip = $request->get('skip');
        $take = $request->get('take');

        $plants = Post::find($postId)->userPlant->skip($skip)->take($take);

        foreach ($plants as $userPlant) {
            // get first image for user plant
            $first_image_for_user_plant = DB::table('image_for_user_plant')
                ->where('user_plant_id', '=', $userPlant->id)
                ->first();

            if ($first_image_for_user_plant != null)
                $userPlant->image_url = asset($first_image_for_user_plant->url);
            else $userPlant->image_url = '';

            // check ???? trao ?????i
            $accepted = DB::table('plant_pending_exchange')
                ->select('accepted')
                ->where('user_plant_pending_id', $userPlant->id)
                ->where('post_id', $postId)
                ->get()[0]->accepted;
            $accepted == 1 ? $userPlant->accepted = 1 : $userPlant->accepted = 0;
        }

        return Response::json([
            'plants' => $plants
        ], 200);
    }

    // CH???P NH???N TRAO ?????I
    public
    function acceptExchangePlant(Request $request) {
        $postId = $request->get('post_id');
        $plantId = $request->get('plant_id');

        //CHECK TRAO ?????I TR?????C ???? V???I C??Y KH??C CH??A, N???U C?? TH?? SET NULL
        DB::table('plant_pending_exchange')
            ->select('accepted')
            ->where('accepted', true)
            ->update(['accepted' => null]);

        //TH??M GI?? TR??? M???I
        DB::table('plant_pending_exchange')
            ->where('user_plant_pending_id', $plantId)
            ->where('post_id', $postId)
            ->update(['accepted' => true]);

        return Response::json([
            'status' => true,
        ], 200);
    }

    // H???Y TRAO ?????I
    public
    function cancelExchangePlant(Request $request) {
        $postId = $request->get('post_id');
        $plantId = $request->get('plant_id');

        DB::table('plant_pending_exchange')
            ->where('user_plant_pending_id', $plantId)
            ->where('post_id', $postId)
            ->update(
                array(
                    'accepted' => null
                )
            );

        return Response::json([
            'status' => true,
        ], 200);
    }

    // CHECK ???? TRAO ?????I HAY CH??A
    public
    function checkAcceptedExchangePlant(Request $request) {
        $postId = $request->get('post_id');
        $plantId = $request->get('plant_id');

        return Response::json([
            'accepted' =>  DB::table('plant_pending_exchange')
                ->select('accepted')
                ->where('user_plant_pending_id', $plantId)
                ->where('post_id', $postId)
                ->get()[0]->accepted,
        ], 200);
    }

    // L???Y DS B??I VI???T USER ???? SAVE CHO TRANG PROFILE THEO C???M
    public
    function getSavedPosts(Request $request)
    {
        $userId = $request->get('user_id');
        $currentUserId = $request->get('current_user_id');

        // L???Y DS ID C???A C??C POST ???????C SAVE
        $postIds = $this->postService->getSavedPostIdsFromUserId($userId);

        // N???u user ??ang xem t?????ng ch??nh m??nh, cho th???y h???t
        // N???u user ??ang xem t?????ng user kh??c, x??t theo role ????? th???y
        $userId == $currentUserId ? $audience = [1, 2] : $audience = $this->postService->getPostAudienceFromUserId($currentUserId);

        // L???Y DS POST T??? DS ID C???A C??C POST ???????C SAVE ??? TR??N
        $posts = $this->postService->getSavedPostFromIdsArray($audience, $postIds, $request->get('skip'), $request->get('take'));
        foreach ($posts as $post) {
            // L???Y H??NH ???NH ?????U TI??N
            $first_image_for_post = $this->imageForPostService->getFirstImageForPostByPostId($post->id);

            if ($first_image_for_post != null)
                // T???O DYNAMIC URL CHO H??NH ???NH ?????U TI??N
                $post->image_url = asset($first_image_for_post->url);
            else $post->image_url = '';

            // L???Y S??? L?????NG COMMENT
            $commentsNumber = $this->commentService->getNumberOfComments($post->id);
            $post->comments_number = $commentsNumber;
        }

        foreach ($posts as $post) {
            $post->short_content .= '...';
        };
        return Response::json([
            'posts' => $posts,
        ], 200);

    }

    // L???Y DS B??I VI???T CHO TRANG NEWSFEED THEO C???M V?? THEO T??? KH??A T??M KI???M
    public
    function getPostForHomeNewsfeed(Request $request)
    {
        // GET ALL POSTS BY CHUNK BY USER ID and FOLLOWING USERS IDS
        $posts = $this->postService->getPostForHomeNewsfeed($request);

        // GET 1 SUGGESTED POST BY EXPERT
        // 1.get 1 random expert
        $randomExpert = User::select('id')->where('role_id', '=', 2)->inRandomOrder()->limit(1)->first();
        // 2.get 1 post from that expert
        $suggestedPost = Post::select('id', 'user_id', 'title', 'created_at', 'like', DB::raw('SUBSTRING(content, 1, 1000) AS short_content'))
            ->where(function ($query) {
                $query->max('like');
            })
            ->where('user_id', '=', $randomExpert->id)
            ->first();

        // 3.if result != null then add to posts list
        $suggestedPost != null ? $posts->add($suggestedPost) : null;
        $suggestedPost != null ? $suggestedPost->is_suggested = true : null;

        // IMAGES FOR POST + COMMENTS NUMBER + USER + SHORT CONTENT HANDLE
        foreach ($posts as $post) {
            $post->is_suggested == null ? $post->is_suggested = false : $post->is_suggested = true;
            // HANDLE SHORT CONTENT
            $post->short_content .= '...';

            // IMAGES FOR POST HANDLE
            $imagesForPost = $post->imagesForPost;

            // handle images for post dynamic url
            foreach ($imagesForPost as $image) {
                $image->dynamic_url = asset($image->url);
            }

            // COMMENTS NUMBER HANDLE
            $commentsNumber = $this->commentService->getNumberOfComments($post->id);
            $post->comments_number = $commentsNumber;

            // USER HANDLE
            $avatar_url = $this->imageForUserService->getAvatarUrl($post->user->id);
            if ($avatar_url != '' && $avatar_url != null)
                $post->user->avatar_url = asset($avatar_url->url);
            else $post->user->avatar_url = '';

            // CHECK LIKED POST OR NOT
            $userId = $request->get('user_id');
            $postId = $post->id;
            $post->is_liked = $this->postService->checkLikedPost($userId, $postId);
        }

        return Response::json([
            'posts' => $posts,
        ], 200);
    }

    public
    function getAllPostsByChunk(Request $request)
    {
        // GET ALL POSTS BY CHUNK
        $posts = Post::select('id', 'user_id', 'title', 'created_at',
            'like', DB::raw('SUBSTRING(content, 1, 1000) AS short_content'))
            ->orderBy('created_at', 'DESC')
            ->skip($request->get('skip'))
            ->take($request->get('take'))
            ->get();

        // IMAGES FOR POST + COMMENTS NUMBER + USER + SHORT CONTENT HANDLE
        foreach ($posts as $post) {
            // HANDLE SHORT CONTENT
            $post->short_content .= '...';

            // IMAGES FOR POST HANDLE
            $imagesForPost = $post->imagesForPost;

            // handle images for post dynamic url
            foreach ($imagesForPost as $image) {
                $image->dynamic_url = asset($image->url);
            }

            // COMMENTS NUMBER HANDLE
            $commentsNumber = count(DB::table('comment')
                ->select('id')
                ->where('post_id', '=', $post->id)
                ->get());
            $post->comments_number = $commentsNumber;

            // USER HANDLE
            $avatar_url = DB::table('image_for_user')
                ->select('url')
                ->where('user_id', '=', $post->user->id)
                ->first();
            if ($avatar_url != '' && $avatar_url != null)
                $post->user->avatar_url = asset($avatar_url->url);
            else $post->user->avatar_url = '';

            // CHECK LIKED POST OR NOT
            $postId = $post->id;
            $userId = $request->get('user_id');

            $result = DB::table('liked_post')
                ->select('post_id', 'user_id')
                ->where('post_id', '=', $postId)
                ->where('user_id', '=', $userId)
                ->get();
            $post->is_liked = !$result->isEmpty();
        }

        return Response::json([
            //'post2' => $postTest,
            'posts' => $posts,

        ], 200);

    }

    public
    function uploadImageToStorage($file, $fileName)
    {
//        $path = storage_path('/uploads/images/store/') ;
//        $file->move($path, $fileName);
        Storage::disk('public')->putFileAs('image_for_post/', $file, $fileName);
    }

    public
    function likePost(Request $request)
    {
        $postId = $request->get('post_id');
        $userId = $request->get('user_id');

        $result = DB::table('liked_post')
            ->select('post_id', 'user_id')
            ->where('post_id', '=', $postId)
            ->where('user_id', '=', $userId)
            ->get();

        $post = Post::find($postId);

        // N???u ch??a like, s??? like
        if ($result->isEmpty()) {
            // UPDATE TABLE TRUNG GIAN
            DB::table('liked_post')->insert([
                'post_id' => $postId,
                'user_id' => $userId,
            ]);
            // UPDATE TABLE POST CHO C???T LIKE
            $post->like++;
            $post->update();

            return Response::json([
                //'result' => 'liked',
                'liked' => true,
                'likes' => Post::where('id', $postId)->select('like')->first(),
            ], 200);
        } // N???u ???? like, s??? unlike
        else {
            // UPDATE TABLE TRUNG GIAN
            DB::table('liked_post')
                ->select('post_id', 'user_id')
                ->where('post_id', '=', $postId)
                ->where('user_id', '=', $userId)
                ->delete();
            // UPDATE TABLE POST CHO C???T LIKE
            $post->like > 0 ? $post->like-- : null;
            $post->update();

            return Response::json([
                //'result' => 'unliked',
                'liked' => false,
                'likes' => Post::where('id', $postId)->select('like')->first(),
            ], 200);
        }
    }

    public
    function checkLikePostOrNot(Request $request)
    {
        $postId = $request->get('post_id');
        $userId = $request->get('user_id');

        $result = DB::table('liked_post')
            ->select('post_id', 'user_id')
            ->where('post_id', '=', $postId)
            ->where('user_id', '=', $userId)
            ->get();
        if ($result->isEmpty()) {
            return Response::json([
                'result' => false,
            ], 200);
        } else {
            return Response::json([
                'result' => true,
            ], 400);
        }
    }

    // T??M KI???M DS B??I VI???T GLOBAL THEO C???M
    public
    function getPostForGlobalNewsfeed(Request $request)
    {
        $userId = $request->get('user_id');
        // GET USER ROLE
        $role_id = $this->userService->getRoleId($userId);
        $role_id == 1 ? $audienceList = [1] : $audienceList = [1, 2]; //N???u l?? expert th?? ???????c xem h???t, user ch??? ???????c xem d??nh cho user
        // GET POSTS
        $posts = $this->postService->getPostForGlobalNewsfeed(
            $userId,
            $audienceList,
            $request->get('skip'),
            $request->get('take'),
            $request->get('keyword'),
            $request
        );
        // IMAGES FOR POST + COMMENTS NUMBER + USER + SHORT CONTENT HANDLE
        foreach ($posts as $post) {
            // HANDLE SHORT CONTENT
            $post->short_content .= '...';

            // IMAGES FOR POST HANDLE
            $imagesForPost = $post->imagesForPost;

            // handle images for post dynamic url
            foreach ($imagesForPost as $image) {
                $image->dynamic_url = asset($image->url);
                $image->makeHidden(['id', 'post_id']);
            }

            // COMMENTS NUMBER HANDLE
            $commentsNumber = $this->commentService->getNumberOfComments($post->id);
            $post->comments_number = $commentsNumber;

            // USER HANDLE
            $post->user;
            $avatar_url = $this->imageForUserService->getAvatarUrl($post->user->id);
            if ($avatar_url != '' && $avatar_url != null)
                $post->user->avatar_url = asset($avatar_url->url);
            else $post->user->avatar_url = '';

            // CHECK LIKED POST OR NOT
            $postId = $post->id;
            $post->is_liked = $this->postService->checkLikedPost($userId, $postId);
        }

        return Response::json([
            'posts' => $posts,
        ], 200);
    }

    // T??M KI???M B??I VI???T HOME THEO C???M
    public
    function homeSearch(Request $request)
    {
        $posts = Post::select('id', 'user_id', 'title', 'created_at', 'like', DB::raw('SUBSTRING(content, 1, 70) AS short_content'))
            ->where('content', 'LIKE', '%' . $request->get('keyword') . '%')
            ->orWhere('title', 'LIKE', '%' . $request->get('keyword') . '%')
            ->orderBy('created_at', 'DESC')
            ->skip($request->get('skip'))
            ->take($request->get('take'))
            ->get();
        // IMAGES FOR POST + COMMENTS NUMBER + USER + SHORT CONTENT HANDLE
        foreach ($posts as $post) {
            // HANDLE SHORT CONTENT
            $post->short_content .= '...';

            // IMAGES FOR POST HANDLE
            $imagesForPost = $post->imagesForPost;

            // handle images for post dynamic url
            foreach ($imagesForPost as $image) {
                $image->dynamic_url = asset($image->url);
                $image->makeHidden(['id', 'post_id']);
            }

            // COMMENTS NUMBER HANDLE
            $commentsNumber = $this->commentService->getNumberOfComments($post->id);
            $post->comments_number = $commentsNumber;

            // USER HANDLE
            $avatar_url = $this->imageForUserService->getAvatarUrl($post->user->id);
            if ($avatar_url != '' && $avatar_url != null)
                $post->user->avatar_url = asset($avatar_url->url);
            else $post->user->avatar_url = '';

            // CHECK LIKED POST OR NOT
            $userId = $request->get('user_id');
            $postId = $post->id;
            $post->is_liked = $this->postService->checkLikedPost($userId, $postId);
        }

        return Response::json([
            'posts' => $posts,
        ], 200);
    }

    // L??U B??I VI???T
    public
    function savePost(Request $request)
    {
        $userId = $request->get('user_id');
        $postId = $request->get('post_id');

        // n???u ch??a save s??? save
        if ($this->postService->checkSavePost($userId, $postId) == false) {
            $this->postService->savePost($userId, $postId);
        }

        return Response::json([
            'message' => 'save post success',
        ], 200);

    }

    // B??? L??U B??I VI???T
    public
    function unSavePost(Request $request)
    {
        $userId = $request->get('user_id');
        $postId = $request->get('post_id');

        $this->postService->unsavePost($userId, $postId);

        return Response::json([
            'message' => 'unsave post success',
        ], 200);

    }

    // KI???M TRA ???? L??U B??I VI???T
    public
    function checkSavePost(Request $request)
    {
        $userId = $request->get('user_id');
        $postId = $request->get('post_id');
        if ($this->postService->checkSavePost($userId, $postId)) {
            return Response::json([
                'saved_post' => true,
            ], 200);
        }
        return Response::json([
            'saved_post' => false,
        ], 200);
    }

    // S???A B??I VI???T
    public function editPost(Request $request)
    {
        //1.L???y content + title + id
        $input = $request->all();
        //2.L???y post t??? post id
        $post = Post::find($request->get('id'));
        //3.Update record
        if ($post != null) {
            $post->fill($input)->save();
            return Response::json([
                'post_id' => $post->id,
            ], 200);
        }
        return Response::json([
            'message' => 'failed',
        ], 400);
    }

    // X??A B??I VI???T
    public function deletePost(Request $request)
    {
        //1.L???y b??i vi???t t??? id
        $result = $this->postService->getPost($request->get('id'));
        //2.N???u c?? b??i vi???t
        if ($result) {
            //2.1.X??a b??i vi???t
            $result->delete();
            //3.Tr??? m?? 200
            return Response::json([
                'message' => 'delete success',
            ], 200);
        }
        //2.2.Tr??? m?? 500
        return Response::json([
            'message' => 'delete fail',
        ], 500);
    }
}
