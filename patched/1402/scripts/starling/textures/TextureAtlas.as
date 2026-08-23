package starling.textures
{
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   import starling.utils.cleanMasterString;
   
   public class TextureAtlas
   {
      
      private static var §_-R2S§:Vector.<String> = new Vector.<String>(0);
      
      private var §_-w1a§:Texture;
      
      private var §_-31r§:Dictionary;
      
      private var §_-627§:Vector.<String>;
      
      public function TextureAtlas(param1:Texture, param2:XML = null)
      {
         super();
         this.§_-31r§ = new Dictionary();
         this.§_-w1a§ = param1;
         if(param2)
         {
            this.§_-H2i§(param2);
         }
      }
      
      private static function §_-hR§(param1:String) : Boolean
      {
         return param1.toLowerCase() == "true";
      }
      
      public function dispose() : void
      {
         this.§_-w1a§.dispose();
      }
      
      protected function §_-H2i§(param1:XML) : void
      {
         var _loc5_:XML = null;
         var _loc6_:String = null;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Boolean = false;
         var _loc2_:Number = this.§_-w1a§.scale;
         var _loc3_:Rectangle = new Rectangle();
         var _loc4_:Rectangle = new Rectangle();
         for each(_loc5_ in param1.SubTexture)
         {
            _loc6_ = cleanMasterString(_loc5_.@name);
            _loc7_ = parseFloat(_loc5_.@x) / _loc2_;
            _loc8_ = parseFloat(_loc5_.@y) / _loc2_;
            _loc9_ = parseFloat(_loc5_.@width) / _loc2_;
            _loc10_ = parseFloat(_loc5_.@height) / _loc2_;
            _loc11_ = parseFloat(_loc5_.@frameX) / _loc2_;
            _loc12_ = parseFloat(_loc5_.@frameY) / _loc2_;
            _loc13_ = parseFloat(_loc5_.@frameWidth) / _loc2_;
            _loc14_ = parseFloat(_loc5_.@frameHeight) / _loc2_;
            _loc15_ = §_-hR§(_loc5_.@rotated);
            _loc3_.setTo(_loc7_,_loc8_,_loc9_,_loc10_);
            _loc4_.setTo(_loc11_,_loc12_,_loc13_,_loc14_);
            if(_loc13_ > 0 && _loc14_ > 0)
            {
               this.§_-32g§(_loc6_,_loc3_,_loc4_,_loc15_);
            }
            else
            {
               this.§_-32g§(_loc6_,_loc3_,null,_loc15_);
            }
         }
      }
      
      public function getTexture(param1:String) : Texture
      {
         return this.§_-31r§[param1];
      }
      
      public function §_-p1v§(param1:String = "", param2:Vector.<Texture> = null) : Vector.<Texture>
      {
         var _loc3_:String = null;
         if(param2 == null)
         {
            param2 = new Vector.<Texture>(0);
         }
         for each(_loc3_ in this.§_-80§(param1,§_-R2S§))
         {
            param2[param2.length] = this.getTexture(_loc3_);
         }
         §_-R2S§.length = 0;
         return param2;
      }
      
      public function §_-80§(param1:String = "", param2:Vector.<String> = null) : Vector.<String>
      {
         var _loc3_:String = null;
         if(param2 == null)
         {
            param2 = new Vector.<String>(0);
         }
         if(this.§_-627§ == null)
         {
            this.§_-627§ = new Vector.<String>(0);
            for(_loc3_ in this.§_-31r§)
            {
               this.§_-627§[this.§_-627§.length] = _loc3_;
            }
            this.§_-627§.sort(Array.CASEINSENSITIVE);
         }
         for each(_loc3_ in this.§_-627§)
         {
            if(_loc3_.indexOf(param1) == 0)
            {
               param2[param2.length] = _loc3_;
            }
         }
         return param2;
      }
      
      public function getRegion(param1:String) : Rectangle
      {
         var _loc2_:SubTexture = this.§_-31r§[param1];
         return _loc2_ ? _loc2_.§_-81V§ : null;
      }
      
      public function §_-E1c§(param1:String) : Rectangle
      {
         var _loc2_:SubTexture = this.§_-31r§[param1];
         return _loc2_ ? _loc2_.frame : null;
      }
      
      public function §_-33W§(param1:String) : Boolean
      {
         var _loc2_:SubTexture = this.§_-31r§[param1];
         return _loc2_ ? _loc2_.rotated : false;
      }
      
      public function §_-32g§(param1:String, param2:Rectangle, param3:Rectangle = null, param4:Boolean = false) : void
      {
         this.§_-31r§[param1] = new SubTexture(this.§_-w1a§,param2,false,param3,param4);
         this.§_-627§ = null;
      }
      
      public function §_-c1B§(param1:String) : void
      {
         var _loc2_:SubTexture = this.§_-31r§[param1];
         if(_loc2_)
         {
            _loc2_.dispose();
         }
         delete this.§_-31r§[param1];
         this.§_-627§ = null;
      }
      
      public function get texture() : Texture
      {
         return this.§_-w1a§;
      }
   }
}

