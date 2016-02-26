module ApplicationHelper

  # Retourner un titre basé sur la page.
  def titre
    base_titre = "Mon site(helper)"
    if @titre.nil?
      base_titre
    else
      "#{base_titre} | #{@titre}"
    end
  end
end