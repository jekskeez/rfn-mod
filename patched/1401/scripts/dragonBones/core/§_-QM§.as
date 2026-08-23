package dragonBones.core
{
   import dragonBones.§_-E1r§;
   import dragonBones.§_-TH§;
   import dragonBones.objects.DBTransform;
   import flash.geom.Matrix;
   
   use namespace dragonBones_internal;
   
   public class §_-QM§
   {
      
      public var name:String;
      
      public var userData:Object;
      
      public var fixedRotation:Boolean;
      
      dragonBones_internal var §_-h1C§:Matrix;
      
      protected var §_-b1v§:int;
      
      dragonBones_internal var §_-t12§:Boolean;
      
      dragonBones_internal var §_-M2f§:DBTransform;
      
      protected var §_-W1I§:DBTransform;
      
      protected var §_-H2O§:DBTransform;
      
      dragonBones_internal var §_-r2y§:DBTransform;
      
      protected var §_-e6§:Boolean;
      
      protected var §_-01r§:§_-TH§;
      
      protected var §_-H2x§:§_-E1r§;
      
      public function §_-QM§()
      {
         super();
         this.§_-M2f§ = new DBTransform();
         this.§_-W1I§ = new DBTransform();
         this.§_-H2O§ = new DBTransform();
         this.§_-r2y§ = new DBTransform();
         this.§_-r2y§.scaleX = this.§_-r2y§.scaleY = 0;
         this.§_-h1C§ = new Matrix();
         this.§_-e6§ = true;
      }
      
      public function get global() : DBTransform
      {
         return this.§_-M2f§;
      }
      
      public function get §_-I2C§() : DBTransform
      {
         return this.§_-W1I§;
      }
      
      public function get offset() : DBTransform
      {
         return this.§_-H2O§;
      }
      
      public function get §_-F1v§() : DBTransform
      {
         return this.§_-H2O§;
      }
      
      public function get visible() : Boolean
      {
         return this.§_-e6§;
      }
      
      public function set visible(param1:Boolean) : void
      {
         this.§_-e6§ = param1;
      }
      
      public function get parent() : §_-TH§
      {
         return this.§_-01r§;
      }
      
      dragonBones_internal function §_-71V§(param1:§_-TH§) : void
      {
         this.§_-01r§ = param1;
      }
      
      public function get armature() : §_-E1r§
      {
         return this.§_-H2x§;
      }
      
      dragonBones_internal function §_-lE§(param1:§_-E1r§) : void
      {
         if(this.§_-H2x§)
         {
            this.§_-H2x§.§_-X§(this);
         }
         this.§_-H2x§ = param1;
         if(this.§_-H2x§)
         {
            this.§_-H2x§.§_-tE§(this);
         }
      }
      
      public function dispose() : void
      {
         this.userData = null;
         this.§_-01r§ = null;
         this.§_-H2x§ = null;
         this.§_-M2f§ = null;
         this.§_-W1I§ = null;
         this.§_-H2O§ = null;
         this.§_-r2y§ = null;
         this.§_-h1C§ = null;
      }
      
      dragonBones_internal function update() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:Matrix = null;
         this.§_-M2f§.scaleX = (this.§_-W1I§.scaleX + this.§_-r2y§.scaleX) * this.§_-H2O§.scaleX;
         this.§_-M2f§.scaleY = (this.§_-W1I§.scaleY + this.§_-r2y§.scaleY) * this.§_-H2O§.scaleY;
         if(this.§_-01r§)
         {
            _loc1_ = this.§_-W1I§.x + this.§_-H2O§.x + this.§_-r2y§.x;
            _loc2_ = this.§_-W1I§.y + this.§_-H2O§.y + this.§_-r2y§.y;
            _loc3_ = this.§_-01r§.§_-h1C§;
            this.§_-h1C§.tx = this.§_-M2f§.x = _loc3_.a * _loc1_ + _loc3_.c * _loc2_ + _loc3_.tx;
            this.§_-h1C§.ty = this.§_-M2f§.y = _loc3_.d * _loc2_ + _loc3_.b * _loc1_ + _loc3_.ty;
            if(this.fixedRotation)
            {
               this.§_-M2f§.skewX = this.§_-W1I§.skewX + this.§_-H2O§.skewX + this.§_-r2y§.skewX;
               this.§_-M2f§.skewY = this.§_-W1I§.skewY + this.§_-H2O§.skewY + this.§_-r2y§.skewY;
            }
            else
            {
               this.§_-M2f§.skewX = this.§_-W1I§.skewX + this.§_-H2O§.skewX + this.§_-r2y§.skewX + this.§_-01r§.§_-M2f§.skewX;
               this.§_-M2f§.skewY = this.§_-W1I§.skewY + this.§_-H2O§.skewY + this.§_-r2y§.skewY + this.§_-01r§.§_-M2f§.skewY;
            }
            if(this.§_-01r§.scaleMode >= this.§_-b1v§)
            {
               this.§_-M2f§.scaleX *= this.§_-01r§.§_-M2f§.scaleX;
               this.§_-M2f§.scaleY *= this.§_-01r§.§_-M2f§.scaleY;
            }
         }
         else
         {
            this.§_-h1C§.tx = this.§_-M2f§.x = this.§_-W1I§.x + this.§_-H2O§.x + this.§_-r2y§.x;
            this.§_-h1C§.ty = this.§_-M2f§.y = this.§_-W1I§.y + this.§_-H2O§.y + this.§_-r2y§.y;
            this.§_-M2f§.skewX = this.§_-W1I§.skewX + this.§_-H2O§.skewX + this.§_-r2y§.skewX;
            this.§_-M2f§.skewY = this.§_-W1I§.skewY + this.§_-H2O§.skewY + this.§_-r2y§.skewY;
         }
         this.§_-h1C§.a = this.§_-M2f§.scaleX * Math.cos(this.§_-M2f§.skewY);
         this.§_-h1C§.b = this.§_-M2f§.scaleX * Math.sin(this.§_-M2f§.skewY);
         this.§_-h1C§.c = -this.§_-M2f§.scaleY * Math.sin(this.§_-M2f§.skewX);
         this.§_-h1C§.d = this.§_-M2f§.scaleY * Math.cos(this.§_-M2f§.skewX);
      }
   }
}

