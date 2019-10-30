class Question
  attr_reader :id, :category, :difficulty, :question, :correct_answer, :options
  def initialize(question)
    @id = question[:id]
    @category = question[:category]
    @difficulty = question[:difficulty]
    @question = question[:question]
    @correct_answer = question[:correct_answer]
    @options = question[:options].shuffle
  end
end
