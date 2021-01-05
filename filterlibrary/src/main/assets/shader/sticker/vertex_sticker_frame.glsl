attribute vec4 aPosition;           // 图像顶点坐标
attribute vec4 aTextureCoord;       // 图像纹理坐标
attribute vec4 aStickerCoord;       // 贴纸纹理坐标

varying vec2 textureCoordinate;     // 图像纹理坐标
varying vec2 stickerCoordinate;     // 贴纸纹理坐标

//变换矩阵， 需要将原本的vCoord（01,11,00,10） 与矩阵相乘 才能够得到 surfacetexure(特殊)的正确的采样坐标
uniform mat4 vMatrix;

void main() {

    gl_Position = aPosition;

    textureCoordinate = aTextureCoord.xy;

    //在使用OpenGL函数加载纹理到图形时，经常遇到纹理上下颠倒的问题。原因是因为OpenGL要求纹理坐标原点在图片最下面
    //而图片信息中的原点一般都在最上方，所以需要处理
//    stickerCoordinate = aStickerCoord.xy;
    stickerCoordinate = vec2(aStickerCoord.x,1.0-aStickerCoord.y);
}