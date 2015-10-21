# automatically generated by generate_docs.py.
doc_x="""Attributes supported by this class are:
tic_len(type:number) default=6.
    The length of tick lines. The value can be negative, in which
    case the tick lines are drawn right of (or above) the axis.
    
tic_label_offset(type:(x,y)) default=(0, 0).
    The location where the tick labels is drawn. Relative to the
    tip of the tick mark.
    
format(type:printf format string) default="%s".
    The format string for tick labels.  It can be a `printf' style
    format string, or a single-parameter function that takes a X
    (or Y) value and returns a string. The appearance of the string
    produced here can be controlled using escape sequences. See
    also pychart.font
    
tic_interval(type:Number or function) default=None.
    When the value is a number, it specifies the interval with
    which tick marks are drawn. Otherwise, the value must be a
    function. It must take no argument and return the list of
    numbers, which specifies the X or Y points where tick marks are
    drawn.
    
label_offset(type:(x,y) or None) default=(None, None).
    The location where the axis label is drawn. Relative to the
    middle of the axis.
    
line_style(type:line_style.T) default=default.
    The style of tick lines.
    
minor_tic_len(type:number) default=3.
    The length of minor tick marks.  The value can be negative, in
    which case the tick lines are drawn right of (or above) the
    axis.
    
minor_tic_interval(type:Number or function) default=None.
    When the value is a number, it specifies the interval with
    which minor tick marks are drawn. Otherwise, the value must be
    a function. It must take no argument and return the list of
    numbers, which specifies the X or Y points where minor tick
    marks are drawn.
    
offset(type:number) default=0.
    The location of the axis. The unit is points.  The value of 0
    draws the axis at the left (for the Y axis) or bottom (for the
    X axis) edge of the drawing area.
    
label(type:str) default="axis label".
    The description of the axis. See also pychart.font.
    
"""

doc_y="""Attributes supported by this class are:
tic_len(type:number) default=6.
    The length of tick lines. The value can be negative, in which
    case the tick lines are drawn right of (or above) the axis.
    
tic_label_offset(type:(x,y)) default=(0, 0).
    The location where the tick labels is drawn. Relative to the
    tip of the tick mark.
    
format(type:printf format string) default="%s".
    The format string for tick labels.  It can be a `printf' style
    format string, or a single-parameter function that takes a X
    (or Y) value and returns a string. The appearance of the string
    produced here can be controlled using escape sequences. See
    also pychart.font
    
tic_interval(type:Number or function) default=None.
    When the value is a number, it specifies the interval with
    which tick marks are drawn. Otherwise, the value must be a
    function. It must take no argument and return the list of
    numbers, which specifies the X or Y points where tick marks are
    drawn.
    
label_offset(type:(x,y) or None) default=(None, None).
    The location where the axis label is drawn. Relative to the
    middle of the axis.
    
line_style(type:line_style.T) default=default.
    The style of tick lines.
    
minor_tic_len(type:number) default=3.
    The length of minor tick marks.  The value can be negative, in
    which case the tick lines are drawn right of (or above) the
    axis.
    
minor_tic_interval(type:Number or function) default=None.
    When the value is a number, it specifies the interval with
    which minor tick marks are drawn. Otherwise, the value must be
    a function. It must take no argument and return the list of
    numbers, which specifies the X or Y points where minor tick
    marks are drawn.
    
offset(type:number) default=0.
    The location of the axis. The unit is points.  The value of 0
    draws the axis at the left (for the Y axis) or bottom (for the
    X axis) edge of the drawing area.
    
label(type:str) default="axis label".
    The description of the axis. See also pychart.font.
    
"""
