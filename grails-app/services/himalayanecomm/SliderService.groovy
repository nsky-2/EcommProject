package himalayanecomm

import HMEcomm.Slider

class SliderService {

    def serviceMethod() {

    }

    def saveSliderImage(def params, def fileName){
        Slider slider= new Slider()
        slider.title= params?.title
        slider.photo=fileName
        slider.status=params?.status

        if(slider.save(flush: true, failOnError: true))
        {
            return true
        }
        else
        {
            return false
        }


    }
}
