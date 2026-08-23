package §_-B37§
{
   import §_-hd§.§_-01M§;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import flash.utils.getQualifiedClassName;
   import starling.textures.Texture;
   import starling.textures.TextureAtlas;
   
   public class §_-Y7§
   {
      
      public static const §_-H1j§:int = 72;
      
      private static var _instance:§_-Y7§ = null;
      
      private var §_-A3k§:Object = {};
      
      private var §_-v11§:Object = {};
      
      private var §_-f1a§:int = 0;
      
      private var §_-oa§:Number = 1;
      
      private var §_-pd§:Boolean = false;
      
      public function §_-Y7§()
      {
         super();
      }
      
      public static function get instance() : §_-Y7§
      {
         if(_instance == null)
         {
            _instance = new §_-Y7§();
         }
         return _instance;
      }
      
      public function §_-03j§(param1:Sprite, param2:Boolean = false) : void
      {
         var _loc6_:DisplayObject = null;
         if(_instance.§_-pd§ && !param2)
         {
            return;
         }
         var _loc3_:String = getQualifiedClassName(param1);
         var _loc4_:Rectangle = null;
         var _loc5_:String = "";
         var _loc7_:Vector.<Object> = new Vector.<Object>();
         var _loc8_:TextureAtlas = null;
         var _loc9_:Object = null;
         var _loc10_:Rectangle = §_-01M§.§_-rt§(param1,this.§_-oa§,this.§_-oa§);
         var _loc11_:BitmapData = new BitmapData(_loc10_.width,_loc10_.height,true,0);
         var _loc12_:Matrix = new Matrix();
         var _loc13_:Number = this.§_-oa§;
         var _loc14_:Number = this.§_-oa§;
         var _loc15_:int = 0;
         var _loc16_:int = param1.numChildren;
         while(_loc15_ < _loc16_)
         {
            _loc6_ = param1.getChildAt(_loc15_);
            if(_loc6_ is Sprite)
            {
               _loc5_ = getQualifiedClassName(_loc6_);
               _loc4_ = _loc6_.getBounds(param1);
               _loc4_.x = Math.ceil(_loc4_.x) - 2;
               _loc4_.y = Math.ceil(_loc4_.y) - 2;
               _loc4_.width = Math.ceil(_loc4_.width);
               _loc4_.height = Math.ceil(_loc4_.height);
               _loc7_.push({
                  "name":_loc5_,
                  "rect":_loc4_
               });
               this.§_-v11§[_loc5_] = _loc3_;
            }
            _loc15_++;
         }
         _loc12_.scale(_loc13_,_loc14_);
         _loc12_.translate(-_loc10_.x,-_loc10_.y);
         _loc11_.draw(param1,_loc12_);
         _loc8_ = new TextureAtlas(§_-01M§.§_-w1A§(_loc11_));
         this.§_-A3k§[_loc3_] = _loc8_;
         _loc15_ = 0;
         _loc16_ = int(_loc7_.length);
         while(_loc15_ < _loc16_)
         {
            _loc9_ = _loc7_[_loc15_];
            _loc8_.§_-32g§(_loc9_.name,_loc9_.rect);
            _loc15_++;
         }
         _loc7_ = null;
         _instance.§_-pd§ = true;
      }
      
      public function getTexture(param1:DisplayObject) : Texture
      {
         var _loc2_:String = getQualifiedClassName(param1);
         var _loc3_:String = this.§_-v11§.hasOwnProperty(_loc2_) ? this.§_-v11§[_loc2_] : null;
         return Boolean(_loc3_) && Boolean(this.§_-A3k§.hasOwnProperty(_loc3_)) && this.§_-A3k§[_loc3_] != null ? this.§_-A3k§[_loc3_].getTexture(_loc2_) as Texture : null;
      }
   }
}

