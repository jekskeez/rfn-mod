package §_-D26§
{
   import dragonBones.core.dragonBones_internal;
   import dragonBones.objects.§_-l2g§;
   import flash.display.BitmapData;
   import starling.textures.SubTexture;
   import starling.textures.Texture;
   import starling.textures.TextureAtlas;
   
   use namespace dragonBones_internal;
   
   public class §_-q1f§ extends TextureAtlas implements §_-oM§
   {
      
      dragonBones_internal var §_-zo§:BitmapData;
      
      protected var §_-ma§:Object;
      
      protected var §_-v2§:Boolean;
      
      protected var §_-Tq§:Number;
      
      protected var _name:String;
      
      public function §_-q1f§(param1:Texture, param2:Object, param3:Boolean = false)
      {
         super(param1,null);
         if(param1)
         {
            this.§_-Tq§ = param1.scale;
            this.§_-v2§ = param3;
         }
         this.§_-ma§ = {};
         this.§_-Q1L§(param2);
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      override public function dispose() : void
      {
         var _loc1_:SubTexture = null;
         super.dispose();
         for each(_loc1_ in this.§_-ma§)
         {
            _loc1_.dispose();
         }
         this.§_-ma§ = null;
         if(this.§_-zo§)
         {
            this.§_-zo§.dispose();
         }
         this.§_-zo§ = null;
      }
      
      override public function getTexture(param1:String) : Texture
      {
         var _loc2_:Texture = this.§_-ma§[param1];
         if(!_loc2_)
         {
            _loc2_ = super.getTexture(param1);
            if(_loc2_)
            {
               this.§_-ma§[param1] = _loc2_;
            }
         }
         return _loc2_;
      }
      
      protected function §_-Q1L§(param1:Object) : void
      {
         var _loc3_:String = null;
         var _loc2_:Object = §_-l2g§.§_-F11§(param1,this.§_-v2§ ? this.§_-Tq§ : 1);
         this._name = _loc2_.__name;
         delete _loc2_.__name;
         for(_loc3_ in _loc2_)
         {
            this.§_-ul§(_loc3_,_loc2_[_loc3_],null);
         }
      }
   }
}

