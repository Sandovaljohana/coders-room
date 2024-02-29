<?php

namespace Tests\Unit;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;
use Illuminate\Support\Facades\Schema; 
use App\Models\Type;
use App\Models\Category;
use App\Models\ExtraResource;
use App\Models\Resource;

class ResourcesControllerTest extends TestCase
{
    use RefreshDatabase, WithFaker; 
   // Este trait reinicia la base de datos después de cada prueba.
    /**
     * Prueba si la tabla 'resources' se crea correctamente.
     *
     * @return void
     */
    public function test_resources_table_is_created()
    {
        // Ejecuta la migración
        $this->artisan('migrate');

        // Asegura que la tabla 'resources' exista en la base de datos
        $this->assertTrue(Schema::hasTable('resources'));
    }

    /**
     * Prueba si las restricciones de clave externa están configuradas correctamente.
     *
     * @return void
     */
    public function test_foreign_key_constraints_are_set_up()
    {
        // Ejecuta la migración
        $this->artisan('migrate');

        // Asegura que las restricciones de clave externa estén configuradas correctamente
        $this->assertTrue(Schema::hasColumn('resources', 'type_id'));
        $this->assertTrue(Schema::hasColumn('resources', 'category_id'));
        $this->assertTrue(Schema::hasColumn('resources', 'extra_resource_id1'));
        $this->assertTrue(Schema::hasColumn('resources', 'extra_resource_id2'));
        $this->assertTrue(Schema::hasColumn('resources', 'extra_resource_id3'));
    }

    public function test_store_creates_a_new_resource()
    {
         // Ejecuta la migración y los seeders
    $this->artisan('migrate --seed');

    // Genera datos ficticios para la solicitud
    $data = [
        'title' => $this->faker->sentence,
        'author' => $this->faker->name,
        'type_id' => Type::inRandomOrder()->first()->id,
        'category_id' => Category::inRandomOrder()->first()->id,
        'extra_resource_id1' => ExtraResource::inRandomOrder()->first()->id,
        'recording' => $this->faker->url,
        'presentation' => $this->faker->url,
        'repository' => $this->faker->url,
        // Agrega otros campos según tus necesidades
    ];

    // Realiza la solicitud al método store
    $response = $this->post(route('resource.store'), $data);

    // Verifica si la redirección es exitosa
    $response->assertRedirect(route('resource.index'));

    // Verifica si el recurso se ha creado correctamente en la base de datos
    $this->assertDatabaseHas('resources', [
        'title' => $data['title'],
        'author' => $data['author'],
        'type_id' => $data['type_id'],
        'category_id' => $data['category_id'],
        'extra_resource_id1' => $data['extra_resource_id1'],
        'recording' => $data['recording'],
        'presentation' => $data['presentation'],
        'repository' => $data['repository'],
        // Agrega otros campos según tus necesidades
    ]);

}

    public function test_show_displays_an_existing_resource()
    {
        
        // Ejecuta la migración y los seeders  
        
        $this->artisan('migrate --seed');


    $resource = Resource::factory()->create();
   // dd($resource);  // Agrega esta línea para imprimir el recurso y verifica si se crea correctamente.
    $response = $this->get(route('resource.show', $resource->id));


    // Verifica si la solicitud fue exitosa
    $response->assertStatus(200);

    // Verifica si la vista correcta está siendo utilizada
    $response->assertViewIs('resourceShow');

    // Verifica si el recurso correcto se está pasando a la vista
    $response->assertViewHas('resource', $resource);

    // Puedes agregar más aserciones según sea necesario
}

public function test_show_displays_an_error_for_nonexistent_resource()
{
    // Ejecuta la migración y los seeders
    
    $this->artisan('migrate --seed');


    // Intenta acceder a un recurso que no existe
    $nonexistentResourceId = 999; // Ajusta esto según tu lógica

    // Realiza la solicitud al método show
    $response = $this->get(route('resource.show', $nonexistentResourceId));

    // Verifica si la solicitud retorna un código 404 (recurso no encontrado)
    $response->assertStatus(500);

}

}
 
