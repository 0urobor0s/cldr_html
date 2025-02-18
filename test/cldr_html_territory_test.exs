defmodule Cldr.HTML.Territory.Test do
  use ExUnit.Case
  doctest Cldr.HTML.Territory

  import Phoenix.HTML, only: [safe_to_string: 1]

  describe "territory_select/3" do
    test "with selected territory" do
      string = safe_to_string(
               Cldr.HTML.Territory.select(
                 :my_form,
                 :territory,
                 territories: [:US, :AU, :HK],
                 selected: :AU
               )
             )
      assert string ==
        ~s(<select id="my_form_territory" name="my_form[territory]">) <>
        ~s(<option value="AU" selected>🇦🇺 Australia</option>) <>
        ~s(<option value="HK">🇭🇰 Hong Kong SAR China</option>) <>
        ~s(<option value="US">🇺🇸 United States</option>) <>
        ~s(</select>)


    end

    test "with selected territory and short names" do
      string = safe_to_string(
               Cldr.HTML.Territory.select(
                 :my_form,
                 :territory,
                 territories: [:US, :AU, :HK],
                 selected: :AU,
                 style: :short
               )
             )
      assert string ==
        ~s(<select id="my_form_territory" name="my_form[territory]">) <>
        ~s(<option value="AU" selected>🇦🇺 Australia</option>) <>
        ~s(<option value=\"HK\">🇭🇰 Hong Kong</option>) <>
        ~s(<option value="US">🇺🇸 US</option>) <>
        ~s(</select>)
    end

    test "with selected territory and variant names" do
      string = safe_to_string(
               Cldr.HTML.Territory.select(
                 :my_form,
                 :territory,
                 territories: [:US, :CZ],
                 selected: :CZ,
                 style: :variant
               )
             )
      assert string ==
        ~s(<select id="my_form_territory" name="my_form[territory]">) <>
        ~s(<option value="CZ" selected>🇨🇿 Czech Republic</option>) <>
        ~s(<option value="US">🇺🇸 United States</option>) <>
        ~s(</select>)
    end

    test "with locale" do
      string = safe_to_string(
               Cldr.HTML.Territory.select(
                 :my_form,
                 :territory,
                 territories: [:US, :AU],
                 selected: :IT,
                 locale: "th"
               )
             )
      assert string ==
         ~s(<select id="my_form_territory" name="my_form[territory]">) <>
         ~s(<option value="AU">🇦🇺 ออสเตรเลีย</option>) <>
         ~s(<option value="IT" selected>🇮🇹 อิตาลี</option>) <>
         ~s(<option value="US">🇺🇸 สหรัฐอเมริกา</option>) <>
         ~s(</select>)
    end
  end
end