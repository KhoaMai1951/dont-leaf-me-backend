<?php


namespace App\Http\Services;


use App\Http\Helpers\ImageUrlHandle;
use App\Http\Models\ServerPlant;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ServerPlantService
{
    // TẠO MỚI PLANT
    public function create($input) {
        return ServerPlant::create($input)->id;
    }

    // LẤY DS THÔNG TIN CÂY CẢNH THEO CỤM
    public function getPlantListByChunk($skip, $take, $keyword)
    {
        $plants = ServerPlant::where(function ($query) use ($keyword) {
            // subqueries
            $query
                ->where('common_name', 'LIKE', '%' . $keyword . '%')
                ->orWhere('scientific_name', 'LIKE', '%' . $keyword . '%');
        })
            ->where('accepted', '=', true)
            ->skip($skip)
            ->take($take)
            ->orderBy('common_name', 'ASC')
            ->get();

        foreach ($plants as $plant) {
            $plant->image_url = ImageUrlHandle::getDynamicImageUrl($plant->image_url);
        }
        return $plants;
    }

    // LẤY CHI TIẾT THÔNG TIN CÂY CẢNH
    public function getPlantDetail($id)
    {
        $plant = ServerPlant::find($id);
        if ($plant != null) {
            $plant->temperature_range = [$plant->min_temperature, $plant->max_temperature];
            $plant->ph_range = [$plant->min_ph, $plant->max_ph];
            $plant->image_url = ImageUrlHandle::getDynamicImageUrl($plant->image_url);
            $plant->makeHidden(['min_temperature', 'max_temperature', 'min_ph', 'max_ph']);
            $plant->pet_friendly == 1 ? $plant->pet_friendly = true : $plant->pet_friendly = false;
        }
        return $plant;
    }



    // UPDATE PLANT
    public function update($input)
    {
        DB::table('server_plant')
            ->where('id', $input['id'])
            ->update($input);
    }
}