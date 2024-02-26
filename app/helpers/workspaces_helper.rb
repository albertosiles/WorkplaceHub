module WorkspacesHelper
  def cloudinary_image_url(index)
    case index
    when 0
      "https://res.cloudinary.com/dhyyrfxic/image/upload/jason-goodman-nF0nQuqBsrI-unsplash_prjsbu.jpg"
    when 1
      "https://res.cloudinary.com/dhyyrfxic/image/upload/cowomen-7Zy2KV76Mts-unsplash_m7f8wy.jpg"
    when 2
      "https://res.cloudinary.com/dhyyrfxic/image/upload/jason-goodman-vbxyFxlgpjM-unsplash_zh3cvf.jpg"
    when 3
      "https://res.cloudinary.com/dhyyrfxic/image/upload/scott-walsh-V9keLsAtxyA-unsplash_w0newy.jpg"
    when 4
      "https://res.cloudinary.com/dhyyrfxic/image/upload/jakub-zerdzicki-46d7l6JP1BM-unsplash_afcayi.jpg"
    else
      "https://res.cloudinary.com/dhyyrfxic/image/upload/lycs-architecture-U2BI3GMnSSE-unsplash_awvby1.jpg"
    end
  end
end
