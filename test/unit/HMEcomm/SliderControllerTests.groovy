package HMEcomm



import org.junit.*
import grails.test.mixin.*

@TestFor(SliderController)
@Mock(Slider)
class SliderControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/slider/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.sliderInstanceList.size() == 0
        assert model.sliderInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.sliderInstance != null
    }

    void testSave() {
        controller.save()

        assert model.sliderInstance != null
        assert view == '/slider/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/slider/show/1'
        assert controller.flash.message != null
        assert Slider.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/slider/list'

        populateValidParams(params)
        def slider = new Slider(params)

        assert slider.save() != null

        params.id = slider.id

        def model = controller.show()

        assert model.sliderInstance == slider
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/slider/list'

        populateValidParams(params)
        def slider = new Slider(params)

        assert slider.save() != null

        params.id = slider.id

        def model = controller.edit()

        assert model.sliderInstance == slider
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/slider/list'

        response.reset()

        populateValidParams(params)
        def slider = new Slider(params)

        assert slider.save() != null

        // test invalid parameters in update
        params.id = slider.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/slider/edit"
        assert model.sliderInstance != null

        slider.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/slider/show/$slider.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        slider.clearErrors()

        populateValidParams(params)
        params.id = slider.id
        params.version = -1
        controller.update()

        assert view == "/slider/edit"
        assert model.sliderInstance != null
        assert model.sliderInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/slider/list'

        response.reset()

        populateValidParams(params)
        def slider = new Slider(params)

        assert slider.save() != null
        assert Slider.count() == 1

        params.id = slider.id

        controller.delete()

        assert Slider.count() == 0
        assert Slider.get(slider.id) == null
        assert response.redirectedUrl == '/slider/list'
    }
}
