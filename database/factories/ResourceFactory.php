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
            'type_id' => Type::factory(),
            'category_id' => Category::factory(),
            'title' => $this->faker->sentence(),
            'author' => $this->faker->name(),
            'recording' => $this->faker->url(),
            'presentation' => $this->faker->url(),
            'repository' => $this->faker->url(),
            'extra_resource_id1' => ExtraResource::factory(),
        ];
    }
}
