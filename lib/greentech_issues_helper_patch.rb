# encoding: utf-8
#noinspection RubyInstanceMethodNamingConvention,DuplicatedCode
module IssuesHelper
  extend IssuesHelper

  def render_half_width_custom_fields_rows(issue)
    values = issue.visible_custom_field_values.reject {|value| value.custom_field.full_width_layout?}
    return if values.empty?
    half = (values.size / 2.0).ceil
    issue_fields_rows do |rows|
      values.each_with_index do |value, i|

        if value.custom_field.id == 33
          value.value = value.value == "" ? "file://T:/gts/#{@issue.id}" : value.value
          _value = value.value.gsub("https://","").gsub("http://","").gsub("file://T:/gts/#","")
          value.value = _value=~/(^\d+)/?"file://T:/gts/#{_value}":"file://T:/gts/#{@issue.id}"
        end

        css = "cf_#{value.custom_field.id}"
        attr_value = show_value(value)
        #noinspection RubyResolve
        if value.custom_field.text_formatting == 'full'
          attr_value = content_tag('div', attr_value, class: 'wiki')
        end
        m = (i < half ? :left : :right)
        rows.send m, custom_field_name_tag(value.custom_field), attr_value, :class => css
      end
    end
  end
end
