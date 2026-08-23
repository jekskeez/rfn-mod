package §_-Rz§
{
   import dragonBones.objects.DBTransform;
   import flash.geom.Matrix;
   import starling.display.DisplayObject;
   import starling.display.§_-jH§;
   import starling.display.§_-u16§;
   import starling.textures.Texture;
   
   public class §_-83J§ implements §_-p1S§
   {
      
      private var §_-w22§:§_-jH§;
      
      private var §_-V14§:Texture;
      
      private var §_-93M§:Number;
      
      private var §_-W2s§:Number;
      
      private var §_-3g§:Object;
      
      public function §_-83J§()
      {
         super();
      }
      
      public function get display() : Object
      {
         return this.§_-3g§;
      }
      
      public function set display(param1:Object) : void
      {
         var _loc2_:* = undefined;
         var _loc3_:int = 0;
         if(this.§_-3g§ == param1)
         {
            return;
         }
         if(this.§_-3g§)
         {
            _loc2_ = this.§_-3g§.parent;
            if(_loc2_)
            {
               _loc3_ = int(this.§_-3g§.parent.getChildIndex(this.§_-3g§));
            }
            this.§_-WF§();
         }
         this.§_-3g§ = param1;
         this.§_-83I§(_loc2_,_loc3_);
      }
      
      public function get visible() : Boolean
      {
         return this.§_-3g§ ? Boolean(this.§_-3g§.visible) : false;
      }
      
      public function set visible(param1:Boolean) : void
      {
         if(this.§_-3g§)
         {
            this.§_-3g§.visible = param1;
         }
      }
      
      public function dispose() : void
      {
         this.§_-3g§ = null;
         this.§_-w22§ = null;
         this.§_-V14§ = null;
      }
      
      public function §_-7S§(param1:Matrix, param2:DBTransform) : void
      {
         var _loc3_:Number = Number(this.§_-3g§.pivotX);
         var _loc4_:Number = Number(this.§_-3g§.pivotY);
         param1.tx -= param1.a * _loc3_ + param1.c * _loc4_;
         param1.ty -= param1.b * _loc3_ + param1.d * _loc4_;
         this.§_-3g§.transformationMatrix.copyFrom(param1);
      }
      
      public function §_-126§(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number) : void
      {
         this.§_-3g§.alpha = param5;
         if(this.§_-3g§ is §_-u16§)
         {
            (this.§_-3g§ as §_-u16§).color = (uint(param6 * 255) << 16) + (uint(param7 * 255) << 8) + uint(param8 * 255);
         }
      }
      
      public function §_-f2H§(param1:String) : void
      {
         if(this.§_-3g§ is DisplayObject)
         {
            this.§_-3g§.blendMode = param1;
         }
      }
      
      public function §_-83I§(param1:Object, param2:int = -1) : void
      {
         if(Boolean(param1) && Boolean(this.§_-3g§))
         {
            if(param2 < 0)
            {
               param1.addChild(this.§_-3g§);
            }
            else
            {
               param1.addChildAt(this.§_-3g§,Math.min(param2,param1.numChildren));
            }
         }
      }
      
      public function §_-WF§() : void
      {
         if(Boolean(this.§_-3g§) && Boolean(this.§_-3g§.parent))
         {
            this.§_-3g§.parent.removeChild(this.§_-3g§,true);
         }
      }
   }
}

