module FellowsHelper
#show_non_blank_field(label, value)
  #"<th>#{label}: #{h value}</th>" if !value.blank?
end
