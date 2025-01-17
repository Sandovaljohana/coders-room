<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Resource;
use App\Models\Type;
use App\Models\Category;
use App\Models\ExtraResource;
/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Resource>
 */
class ResourceFactory extends Factory
{
    protected $model = Resource::class;
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        return [
            'type_id' => Type::all()->random()->id,
            'category_id' => Category::all()->random()->id,
            'title' => fake()->sentence(),
            'author' => fake()->name(),
            'recording' => fake()->url(),
            'presentation' => fake()->url(),
            'repository' => fake()->url(),
            'extra_resource_id1' => ExtraResource::all()->random()->id
        ];
    }
}
