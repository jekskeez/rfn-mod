package §_-Rz§
{
   import dragonBones.objects.DBTransform;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   
   public class §_-v2r§ implements §_-p1S§
   {
      
      private var §_-3g§:DisplayObject;
      
      private var §_-B2u§:ColorTransform;
      
      public function §_-v2r§()
      {
         super();
      }
      
      public function get display() : Object
      {
         return this.§_-3g§;
      }
      
      public function set display(param1:Object) : void
      {
         var _loc2_:DisplayObjectContainer = null;
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
               _loc3_ = this.§_-3g§.parent.getChildIndex(this.§_-3g§);
            }
            this.§_-WF§();
         }
         this.§_-3g§ = param1 as DisplayObject;
         this.§_-83I§(_loc2_,_loc3_);
      }
      
      public function get visible() : Boolean
      {
         return this.§_-3g§ ? this.§_-3g§.visible : false;
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
         this.§_-B2u§ = null;
      }
      
      public function §_-7S§(param1:Matrix, param2:DBTransform) : void
      {
         this.§_-3g§.transform.matrix = param1;
      }
      
      public function §_-126§(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number) : void
      {
         if(!this.§_-B2u§)
         {
            this.§_-B2u§ = this.§_-3g§.transform.colorTransform;
         }
         this.§_-B2u§.alphaOffset = param1;
         this.§_-B2u§.redOffset = param2;
         this.§_-B2u§.greenOffset = param3;
         this.§_-B2u§.blueOffset = param4;
         this.§_-B2u§.alphaMultiplier = param5;
         this.§_-B2u§.redMultiplier = param6;
         this.§_-B2u§.greenMultiplier = param7;
         this.§_-B2u§.blueMultiplier = param8;
         this.§_-3g§.transform.colorTransform = this.§_-B2u§;
      }
      
      public function §_-f2H§(param1:String) : void
      {
         this.§_-3g§.blendMode = param1;
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
            this.§_-3g§.parent.removeChild(this.§_-3g§);
         }
      }
   }
}

