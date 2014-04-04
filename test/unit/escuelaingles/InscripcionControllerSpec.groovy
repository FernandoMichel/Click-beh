package escuelaingles



import grails.test.mixin.*
import spock.lang.*

@TestFor(InscripcionController)
@Mock(Inscripcion)
class InscripcionControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.inscripcionInstanceList
            model.inscripcionInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.inscripcionInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def inscripcion = new Inscripcion()
            inscripcion.validate()
            controller.save(inscripcion)

        then:"The create view is rendered again with the correct model"
            model.inscripcionInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            inscripcion = new Inscripcion(params)

            controller.save(inscripcion)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/inscripcion/show/1'
            controller.flash.message != null
            Inscripcion.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def inscripcion = new Inscripcion(params)
            controller.show(inscripcion)

        then:"A model is populated containing the domain instance"
            model.inscripcionInstance == inscripcion
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def inscripcion = new Inscripcion(params)
            controller.edit(inscripcion)

        then:"A model is populated containing the domain instance"
            model.inscripcionInstance == inscripcion
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/inscripcion/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def inscripcion = new Inscripcion()
            inscripcion.validate()
            controller.update(inscripcion)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.inscripcionInstance == inscripcion

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            inscripcion = new Inscripcion(params).save(flush: true)
            controller.update(inscripcion)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/inscripcion/show/$inscripcion.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/inscripcion/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def inscripcion = new Inscripcion(params).save(flush: true)

        then:"It exists"
            Inscripcion.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(inscripcion)

        then:"The instance is deleted"
            Inscripcion.count() == 0
            response.redirectedUrl == '/inscripcion/index'
            flash.message != null
    }
}
