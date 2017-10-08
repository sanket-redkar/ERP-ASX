module ApplicationHelper

  def error_messages(object)
    html = ''
    if object.errors.any?
      html += '<div class="panel panel-danger" id="error_expl">' +
        '<div class="panel-heading">' +
          '<h3 class="panel-title">' +
            pluralize(object.errors.count, "error") +
            'prohibited this campaign from being saved:' +
          '</h3>' +
        '</div>' +
        '<div class="panel-body">' +
          '<ul>' +
            object.errors.full_messages.map{ |msg| "<li>#{msg}</li>" }.join('') +
          '</ul>' +
        '</div>' +
      '</div>'
    end
    html.html_safe
  end
end
