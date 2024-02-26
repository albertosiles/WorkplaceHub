module WorkspacesHelper
  def cloudinary_image_url(index)
    # Construct the environment variable name based on the index
    env_var_name = "CLOUDINARY_IMAGE_#{index}"

    # Use the corresponding environment variable if present, otherwise fall back to default URL
    case index
    when 0
      ENV[env_var_name] || "https://res.cloudinary.com/dhyyrfxic/image/upload/jason-goodman-nF0nQuqBsrI-unsplash_prjsbu.jpg"
    when 1
      ENV[env_var_name] || "https://res.cloudinary.com/dhyyrfxic/image/upload/cowomen-7Zy2KV76Mts-unsplash_m7f8wy.jpg"
    when 2
      ENV[env_var_name] || "https://res.cloudinary.com/dhyyrfxic/image/upload/jason-goodman-vbxyFxlgpjM-unsplash_zh3cvf.jpg"
    when 3
      ENV[env_var_name] || "https://res.cloudinary.com/dhyyrfxic/image/upload/scott-walsh-V9keLsAtxyA-unsplash_w0newy.jpg"
    when 4
      ENV[env_var_name] || "https://res.cloudinary.com/dhyyrfxic/image/upload/jakub-zerdzicki-46d7l6JP1BM-unsplash_afcayi.jpg"
    else
      ENV['DEFAULT_CLOUDINARY_IMAGE'] || "https://res.cloudinary.com/dhyyrfxic/image/upload/lycs-architecture-U2BI3GMnSSE-unsplash_awvby1.jpg"
    end
  end
end
