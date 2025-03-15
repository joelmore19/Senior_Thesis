extends Control
# The array of objects that are assigned values corressponding to the nodes
var questions = [
	{
		"Question": "When do you use an 'if-else' statement?",
		"Answers": ["It's used to create conditions", "It's used to print to a terminal", "It's used to select different options","It's used to create variables"],
		"correctAnswerIndex": 0
	},
	{
		"Question": "What data type can only be used to create true or false statements?",
		"Answers": ["float", "for", "boolean","int"],
		"correctAnswerIndex": 2
	},
	{
		"Question": "What is an array?",
		"Answers": ["A line where elements are added and removed", "LIFO", "A data structure consisting of vertices and edges","A collection of items of the same variable type"],
		"correctAnswerIndex": 3
	},
	{
		"Question": "Which data structure follows LIFO (Last In First Out)?",
		"Answers": ["Queue", "Stack", "Priority Queue","Graph"],
		"correctAnswerIndex": 1
	},
	{
		"Question": "What's the difference between a for loop, and a while loop?",
		"Answers": ["There is no difference", "A for loop has fixed iterations; a while loop does not", "A for loop is undefined; a while loop is defined","A for loop updates values; a while loop modifies values"],
		"correctAnswerIndex": 1
	},
	{
		"Question": "Which operation can be used to iterate an 'int' variable by one?",
		"Answers": ["==", "-=", "?:","++"],
		"correctAnswerIndex": 3
	},
	{
		"Question": "Can an 'int' data type accept decimal numbers?",
		"Answers": ["Yes, because a decimal is an integer", "No, because decimals are language based", "No, because the int variable only accepts whole numbers","Yes, because the user can change the data type"],
		"correctAnswerIndex": 2
	},
	{
		"Question": "What does '+=' do to a variable?",
		"Answers": ["Adds and assigns to the same variable", "It allows the nesting of if statements", "Terminates a sequence within a switch statement","All of the above"],
		"correctAnswerIndex": 0
	},
	{
		"Question": "In a conditional statement, how would one create the 'or' operator?",
		"Answers": ["==", "||", "&&","<="],
		"correctAnswerIndex": 1
	},
	{
		"Question": "The 'String' data type can do what?",
		"Answers": ["Ask for user input", "Create a string of characters", "Print words","Skip conditional statements"],
		"correctAnswerIndex": 1
	}
]

var current_question_index = 0
var correct_answer = 0
@onready var question_label = $QuestionLabel
@onready var answers = [
	$Answers/Option1,
	$Answers/Option2,
	$Answers/Option3,
	$Answers/Option4
]
@onready var feedback_label = $FeedbackLabel
@onready var next_quesion_timer = $NextQuestionTimer

func _ready():
	display_question(current_question_index)
	
func display_question(index):
	var question = questions[index]
	question_label.text = question["Question"]
	for i in range(4):
		answers[i].text = question["Answers"][i]
		answers[i].set_meta("index", i)
		feedback_label.text = "Feedbck goes here"
		
func _on_Answer_pressed(answers):
	var answer_index = answers.get_meta("index")
	var question = questions[current_question_index]
	if answer_index == question["correctAnswerIndex"]:
		feedback_label.text = "Correct!"
		correct_answer += 1
	else:
		feedback_label.text = "Incorrect"
	next_question_()
	

func _on_option_1_pressed():
	next_question_()

func _on_option_2_pressed():
	next_question_()

func _on_option_3_pressed():
	next_question_()

func _on_option_4_pressed():
	next_question_()


func next_question_():
	if current_question_index <= questions.size():
		current_question_index += 1
		display_question(current_question_index)
	else:
		results_()

func results_():
	var _result_text
	var score = round(correct_answer / questions.size())
	if score <= 60:
		_result_text = "Sheesh, you need a bit more practice!"
	else: 
		_result_text = "Woooooow! What an outstanding student you are!"

