extends Node2D

onready var dragAndDropComponent : ColorRect = $ColorRect
onready var dragLine : Line2D = $Line2D
var isDragging : bool = false
var start : Vector2
var startV : Vector2
var end : Vector2
var endV : Vector2
var arrVectorOfDrag : Array
var directionOfLineVector : Vector2 
export var dragDistance : float = 1.5

func _ready():
	dragAndDropComponent.rect_scale = Vector2(int(isDragging), int(isDragging))

func _physics_process(delta):
	draw()

func draw():
	if Input.is_action_just_pressed("ui_left_mouse_button"):
		start = get_global_mouse_position()
		arrVectorOfDrag.append(start)
	if Input.is_action_pressed("ui_left_mouse_button"):
		isDragging = true
		
		if isDragging == true:
			end = get_global_mouse_position()
			arrVectorOfDrag.append(end)
			
		
	
	if Input.is_action_just_released("ui_left_mouse_button"):
		isDragging = false
		arrVectorOfDrag.clear()
		dragAndDropComponent.rect_scale = Vector2(int(isDragging), int(isDragging))
	#dragLine.points = arrVectorOfDrag
	dragAndDropComponent.rect_position = start
	var getDirectionOfDrag = end - start
	getDirectionOfDrag = getDirectionOfDrag.normalized()
	
	
	if isDragging == true:
		dragAndDropComponent.rect_scale = getDirectionOfDrag * dragDistance
		dragAndDropComponent.rect_size = Vector2(abs(start.x - end.x), abs(start.y - end.y))
		


	

		

		
	
			
			
			
