package §_-6R§
{
   import dragonBones.objects.DBTransform;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   
   public class §_-518§ implements §_-E20§
   {
      
      private var §_-U0§:DisplayObject;
      
      private var §_-61S§:ColorTransform;
      
      public function §_-518§()
      {
         super();
      }
      
      public function get display() : Object
      {
         return this.§_-U0§;
      }
      
      public function set display(param1:Object) : void
      {
         var _loc2_:DisplayObjectContainer = null;
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
               _loc3_ = this.§_-U0§.parent.getChildIndex(this.§_-U0§);
            }
            this.§_-Ia§();
         }
         this.§_-U0§ = param1 as DisplayObject;
         this.§_-A3B§(_loc2_,_loc3_);
      }
      
      public function get visible() : Boolean
      {
         return this.§_-U0§ ? this.§_-U0§.visible : false;
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
         this.§_-61S§ = null;
      }
      
      public function §_-Mh§(param1:Matrix, param2:DBTransform) : void
      {
         this.§_-U0§.transform.matrix = param1;
      }
      
      public function §_-zJ§(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number) : void
      {
         if(!this.§_-61S§)
         {
            this.§_-61S§ = this.§_-U0§.transform.colorTransform;
         }
         this.§_-61S§.alphaOffset = param1;
         this.§_-61S§.redOffset = param2;
         this.§_-61S§.greenOffset = param3;
         this.§_-61S§.blueOffset = param4;
         this.§_-61S§.alphaMultiplier = param5;
         this.§_-61S§.redMultiplier = param6;
         this.§_-61S§.greenMultiplier = param7;
         this.§_-61S§.blueMultiplier = param8;
         this.§_-U0§.transform.colorTransform = this.§_-61S§;
      }
      
      public function §_-92H§(param1:String) : void
      {
         this.§_-U0§.blendMode = param1;
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
            this.§_-U0§.parent.removeChild(this.§_-U0§);
         }
      }
   }
}

