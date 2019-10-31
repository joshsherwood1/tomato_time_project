module ApplicationHelper
  def questions
    [
      ['5', '5'],
      ['10', '10'],
      ['15', '15'],
      ['20', '20'],
      ['25', '25'],
      ['30', '30'],
    ]
  end

  def categories
    [
      ['Geography', 'Geography'],
      ['History', 'History'],
      ['Books', 'Entertainment: Books'],
      ['Movies', 'Entertainment: Film'],
      ['Television', 'Entertainment: Television'],
      ['Music', 'Entertainment: Music'],
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
  #
  # def convert_for_api_call_categories
  #   [
  #     ['Geography', '22'],
  #     ['History', '23'],
  #     ['Books', '10'],
  #     ['Movies', '11'],
  #     ['Television', '14'],
  #     ['Music', '12'],
  #     ['General Knowledge', '9'],
  #     ['Science & Nature', '17'],
  #   ]
  # end
end
