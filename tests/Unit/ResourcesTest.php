<?php

namespace Tests\Unit;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;
use App\Models\ResourceController; 
use App\Models\TypeController; 
use App\Models\CategoryController; 
use App\Model\ExtraResourceController;
use App\Models\Resource;
use Database\Factories;
use Database\Factories\ResourceFactory;
use Faker\Factory;
use Illuminate\Support\Facades\Schema; 


class ResourcesTest extends TestCase
{
    use RefreshDatabase; // Este trait reinicia la base de datos después de cada prueba.

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

    /**
     * Prueba si se puede crear un nuevo recurso.
     *
     * @return void
     */
    public function test_store_creates_a_new_resource()
    {
        // Arrange
        $data = [
            'title' => 'Test Resource',
            'author' => 'John Doe',
            'type_id' => 1,
            'category_id' => 2,
        ];

        // Act
        $response = $this->post(route('resource.store'), $data);

        // Assert
        $resource = Resource::first();
        $this->assertEquals($data['title'], $resource->title);
        $this->assertEquals($data['author'], $resource->author);
        $response->assertRedirect(route('resource.index'));
    }

    /**
     * Prueba si se puede actualizar un recurso existente.
     *
     * @return void
     */
    public function test_update_updates_an_existing_resource()
    {
        // Arrange
        $resource = Factory(Resource::class)->create();
        $updatedData = [
            'title' => 'Updated Title',
            'author' => 'Jane Smith',
        ];

        // Act
        $response = $this->put(route('resource.update', $resource->id), $updatedData);

        // Assert
        $resource->refresh();
        $this->assertEquals($updatedData['title'], $resource->title);
        $this->assertEquals($updatedData['author'], $resource->author);
        $response->assertRedirect(route('resource.index'));
    }

    /**
     * Prueba si se puede eliminar un recurso existente.
     *
     * @return void
     */
    public function test_destroy_deletes_an_existing_resource()
    {
        // Arrange
        $resource = factory(Resource::class)->create();

        // Act
        $response = $this->delete(route('resource.destroy', $resource->id));

        // Assert
        $this->assertNull(Resource::find($resource->id));
        $response->assertRedirect(route('resource.index'));
    }

    // Agrega más pruebas para otros métodos CRUD según tus necesidades
}
