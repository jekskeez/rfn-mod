package §_-JM§
{
   import dragonBones.core.dragonBones_internal;
   import dragonBones.objects.§_-C1V§;
   import flash.display.BitmapData;
   import starling.textures.SubTexture;
   import starling.textures.Texture;
   import starling.textures.TextureAtlas;
   
   use namespace dragonBones_internal;
   
   public class §_-A3Y§ extends TextureAtlas implements §_-c1Q§
   {
      
      dragonBones_internal var §_-F1b§:BitmapData;
      
      protected var §_-73P§:Object;
      
      protected var §_-k1d§:Boolean;
      
      protected var §_-a12§:Number;
      
      protected var _name:String;
      
      public function §_-A3Y§(param1:Texture, param2:Object, param3:Boolean = false)
      {
         super(param1,null);
         if(param1)
         {
            this.§_-a12§ = param1.scale;
            this.§_-k1d§ = param3;
         }
         this.§_-73P§ = {};
         this.§_-F1X§(param2);
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      override public function dispose() : void
      {
         var _loc1_:SubTexture = null;
         super.dispose();
         for each(_loc1_ in this.§_-73P§)
         {
            _loc1_.dispose();
         }
         this.§_-73P§ = null;
         if(this.§_-F1b§)
         {
            this.§_-F1b§.dispose();
         }
         this.§_-F1b§ = null;
      }
      
      override public function getTexture(param1:String) : Texture
      {
         var _loc2_:Texture = this.§_-73P§[param1];
         if(!_loc2_)
         {
            _loc2_ = super.getTexture(param1);
            if(_loc2_)
            {
               this.§_-73P§[param1] = _loc2_;
            }
         }
         return _loc2_;
      }
      
      protected function §_-F1X§(param1:Object) : void
      {
         var _loc3_:String = null;
         var _loc2_:Object = §_-C1V§.§_-P1P§(param1,this.§_-k1d§ ? this.§_-a12§ : 1);
         this._name = _loc2_.__name;
         delete _loc2_.__name;
         for(_loc3_ in _loc2_)
         {
            this.§_-32g§(_loc3_,_loc2_[_loc3_],null);
         }
      }
   }
}

