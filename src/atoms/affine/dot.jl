import LinearAlgebra.dot
export dot

dot(x::AbstractExpr, y::AbstractExpr) = sum(broadcast(*, x, y))
dot(x::Value, y::AbstractExpr) = sum(broadcast(*, Constant(x), y))
dot(x::AbstractExpr, y::Value) = sum(broadcast(*, x, Constant(y)))

if isdefined(LinearAlgebra, :vecdot) # defined but deprecated
    import LinearAlgebra: vecdot
end
Base.@deprecate vecdot(x::AbstractExpr, y::AbstractExpr) dot(x, y)
Base.@deprecate vecdot(x::Value, y::AbstractExpr) dot(x, y)
Base.@deprecate vecdot(x::AbstractExpr, y::Value) dot(x, y)
