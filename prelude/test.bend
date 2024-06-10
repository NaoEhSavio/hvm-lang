type Tree: 
  Node {~left , ~right}
  Leaf {value}

# # def main():
# #   # if (5 < 2):
# #   #   return 0
# #   # elif 2:
# #   #   return 1
# #   # elif 1:
# #   #   return 2
# #   # else:
# #   #   return 3
# # # decimal =     1194684
# # # binary =      0b100_100_011_101_010_111_100
# # # hexadecimal = 0x123_abc
# # # hex_signed = -0xbeef


# # Foldl func init (List/Nil) = init
# # Foldl func init (List/Cons head tail) = (func head (Foldl func init tail))
# def foldl(f, i, x):
#   match x :
#     case List/Cons:
#       return f(x.head, foldl(f, i, x.tail))
#     case List/Nil:
#       return i
#   # [1, [2, [3, [4, [5, [6, [7, [8, [9, 0]]]]]]]]]


# # Foldr func init (List/Nil) = init
# # Foldr func init (List/Cons head tail) = (Foldr func (func head init) tail)
# def foldr(f, i, x):
#   match x:
#     case List/Cons:
#       return foldr(f, f(x.head,i), x.tail)
#     case List/Nil:
#       return i
#   # [9, [8, [7, [6, [5, [4, [3, [2, [1, 0]]]]]]]]]
# def func(w):
  # bend i = 0:
  #   when i < 50: 
  #     y = fork((i + 1)) 
  #   else:
  #     y = 1
  # bend x = 0:
  #   when x < 2:
  #     left = fork(x + 1)
  #     right = fork(x + 1)
  #     y = Tree/Node(left, right)
  #   else:
  #     y = Tree/Leaf(x)
  # return y

def soma_recursiva(soma):
  bend soma,x,i = 0:  # inicializa com soma e i
    when i < 5:        # condição de continuação
      soma += i
      x = soma + 1
      y = fork(soma, x, i + 1) # chamada recursiva com estado atualizado
    else:               # condição de parada
      y = (x)
  return y
# object Point { x , y }

def main():
  # fold x = [1,2,3,4,5,6,7,8,9]:
  #   case List/Cons:
  #     return [x.head, x.tail]
  #   case List/Nil:
  #     return 0
  # # [1, [2, [3, [4, [5, [6, [7, [8, [9, 0]]]]]]]]]
  # return foldr(lambda x, y: [x,y], 0, [1,2,3,4,5,6,7,8,9])
  # p = Point {x: 1, y: 2}

  # open Point: p # variable
  # return Point { x: p.x * p.x, y: p.y * p.y }
  (fst, snd) = ("Hi", 2)
  return fst

# def Sum(start, target):
#   if start == target:
#     # If the value of start is the same as target, returns start.
#     return start
#   else:
#     # If start is not equal to target, calculate the midpoint (half),
#     # then recursively call Sum on both halves.
#     half = (start + target) / 2
#     left = Sum(start, half)  # (Start -> Half)
#     right = Sum(half + 1, target)
#     return left + right

# A parallelizable sum of numbers from 1 to 1000000
# def main():
#   # This translates to (((1 + 2) + (3 + 4)) + ... (999999 + 1000000)...)
#   bend x = 0:
#     when x < 10:
#       y = fork(x + 1)
#     else:
#       y = x
#     return y