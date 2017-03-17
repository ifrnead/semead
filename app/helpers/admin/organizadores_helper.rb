module Admin::OrganizadoresHelper

  def organizadores_path(obj)
    if obj.new_record?
      return admin_organizadores_path
    else
      return admin_organizador_path(obj)
    end
  end

end
