package §_-6R§
{
   import dragonBones.objects.DBTransform;
   import flash.geom.Matrix;
   import starling.display.DisplayObject;
   import starling.display.§_-I2q§;
   import starling.display.§_-V2h§;
   import starling.textures.Texture;
   
   public class §_-h1s§ implements §_-E20§
   {
      
      private var §_-w2K§:§_-I2q§;
      
      private var §_-H0§:Texture;
      
      private var §_-p13§:Number;
      
      private var §_-z7§:Number;
      
      private var §_-U0§:Object;
      
      public function §_-h1s§()
      {
         super();
      }
      
      public function get display() : Object
      {
         return this.§_-U0§;
      }
      
      public function set display(param1:Object) : void
      {
         var _loc2_:* = undefined;
         var _loc3_:int = 0;
         if(this.§_-U0§ == param1)
         {
            return;
         }
         if(this.§_-U0§)
         {
            _loc2_ = this.§_-U0§.parent;
            if(_loc2_)
            {
               _loc3_ = int(this.§_-U0§.parent.getChildIndex(this.§_-U0§));
            }
            this.§_-Ia§();
         }
         this.§_-U0§ = param1;
         this.§_-A3B§(_loc2_,_loc3_);
      }
      
      public function get visible() : Boolean
      {
         return this.§_-U0§ ? Boolean(this.§_-U0§.visible) : false;
      }
      
      public function set visible(param1:Boolean) : void
      {
         if(this.§_-U0§)
         {
            this.§_-U0§.visible = param1;
         }
      }
      
      public function dispose() : void
      {
         this.§_-U0§ = null;
         this.§_-w2K§ = null;
         this.§_-H0§ = null;
      }
      
      public function §_-Mh§(param1:Matrix, param2:DBTransform) : void
      {
         var _loc3_:Number = Number(this.§_-U0§.pivotX);
         var _loc4_:Number = Number(this.§_-U0§.pivotY);
         param1.tx -= param1.a * _loc3_ + param1.c * _loc4_;
         param1.ty -= param1.b * _loc3_ + param1.d * _loc4_;
         this.§_-U0§.transformationMatrix.copyFrom(param1);
      }
      
      public function §_-zJ§(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number) : void
      {
         this.§_-U0§.alpha = param5;
         if(this.§_-U0§ is §_-V2h§)
         {
            (this.§_-U0§ as §_-V2h§).color = (uint(param6 * 255) << 16) + (uint(param7 * 255) << 8) + uint(param8 * 255);
         }
      }
      
      public function §_-92H§(param1:String) : void
      {
         if(this.§_-U0§ is DisplayObject)
         {
            this.§_-U0§.blendMode = param1;
         }
      }
      
      public function §_-A3B§(param1:Object, param2:int = -1) : void
      {
         if(Boolean(param1) && Boolean(this.§_-U0§))
         {
            if(param2 < 0)
            {
               param1.addChild(this.§_-U0§);
            }
            else
            {
               param1.addChildAt(this.§_-U0§,Math.min(param2,param1.numChildren));
            }
         }
      }
      
      public function §_-Ia§() : void
      {
         if(Boolean(this.§_-U0§) && Boolean(this.§_-U0§.parent))
         {
            this.§_-U0§.parent.removeChild(this.§_-U0§,true);
         }
      }
   }
}

