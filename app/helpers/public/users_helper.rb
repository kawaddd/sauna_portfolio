module Public::UsersHelper
  def gender_ja(str)
    if str == "male"
      "男性"
    elsif str == "female"
      "女性"
    else
      "選択されていません"
    end
  end
end