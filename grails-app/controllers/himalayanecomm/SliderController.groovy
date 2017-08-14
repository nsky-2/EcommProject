package himalayanecomm

import HMEcomm.Product
import HMEcomm.Slider
import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile

class SliderController {
    def sliderService

    def index() {}

    def sliderView(){
        def slider=Slider.createCriteria().list {
            eq('isDeleted',false)
        }
        println "slider = $slider"
        [slider: slider]
    }

    def addSlider(){

    }

    def insertSliderImage(){
        String imageUploadPath=grailsApplication.config.imageUpload.path
        println "imageUploadPath = $imageUploadPath"
        MultipartHttpServletRequest mpt = (MultipartHttpServletRequest)request;
        println "mpt"
        CommonsMultipartFile file =(CommonsMultipartFile) mpt.getFile("image");

        def filename= ''

        try{
            if(file && !file.empty)
            {
                filename= "Slider"+params.title+"_0001.jpg"
                file.transferTo(new File("${imageUploadPath}/${filename}"))
                println "file = $filename"
            }

        }
        catch (Exception e)
        {
            log.error("Your exception here",e)
        }
        Slider slider1= new Slider()
        slider1.title= params?.title
        slider1.photo=filename
        slider1.status=params?.status?:'Active'

        if(slider1.save(flush: true, failOnError: true)){
            def slider=Slider.list()
            println "slider = $slider"
            render (view: 'sliderView',model: [slider:slider, imgPath:imageUploadPath])
//            render "success"
        } else{
            render "Error"
        }

    }

    def showImage() {
        println "params = $params"
        def sliderInstance = Slider.findByIdAndIsDeleted(params?.id.toLong(),false)
        println "sliderInstance = $sliderInstance?.photo"
//  write the image to the output stream
        String imageUploadPath=grailsApplication.config.imageUpload.path
        def file = new File("${imageUploadPath}/${sliderInstance?.photo}")
        response.setContentType("application/jpg")
        OutputStream out = response.getOutputStream();
        out.write(file.bytes);
        out.close();
//        response.outputStream << productInstance.photo
//        response.outputStream.flush()
    }

    def update


}
