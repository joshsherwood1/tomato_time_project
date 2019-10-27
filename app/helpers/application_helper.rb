module ApplicationHelper
  def questions
    [
      ['1', '1'],
      ['2', '2'],
      ['3', '3'],
      ['4', '4'],
      ['5', '5'],
      ['6', '6'],
      ['7', '7'],
      ['8', '8'],
      ['9', '9'],
      ['10', '10'],
    ]
  end

  def categories
    [
      ['Geography', 'Geography'],
      ['History', 'History'],
      ['Books', 'Books'],
      ['Movies', 'Movies'],
      ['Television', 'Television'],
      ['Music', 'Music'],
      ['General Knowledge', 'General Knowledge'],
      ['Science & Nature', 'Science & Nature'],
    ]
  end

  def difficulties
    [
      ['Easy', 'easy'],
      ['Medium', 'medium'],
      ['Hard', 'hard'],
    ]
  end

  def convert_for_api_call_categories
    [
      ['Geography', '22'],
      ['History', '23'],
      ['Books', '10'],
      ['Movies', '11'],
      ['Television', '14'],
      ['Music', '12'],
      ['General Knowledge', '9'],
      ['Science & Nature', '17'],
    ]
  end
end
