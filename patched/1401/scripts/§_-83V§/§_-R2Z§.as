package §_-83V§
{
   import §_-RI§.§_-h2I§;
   import flash.display.Shape;
   import game.mainGame.entity.§_-63Q§;
   
   public class §_-R2Z§ extends §_-h2I§
   {
      
      private var §_-i1U§:§_-h2I§ = new §_-h2I§();
      
      private var §_-S1v§:§_-h2I§ = new §_-h2I§();
      
      protected var §_-c14§:§_-h2I§;
      
      protected var §_-12X§:Vector.<§_-63Q§> = new Vector.<§_-63Q§>();
      
      public var §_-6y§:Vector.<§_-63Q§> = new Vector.<§_-63Q§>();
      
      protected var §_-C1B§:Boolean = false;
      
      public function §_-R2Z§()
      {
         super();
         this.§_-c14§ = new §_-h2I§();
         §_-83v§(this.§_-i1U§);
         §_-83v§(this.§_-c14§);
      }
      
      override public function set alpha(param1:Number) : void
      {
         if(this.touchable && param1 < 1)
         {
            this.touchable = false;
         }
         super.alpha = param1;
      }
      
      public function §_-r11§(param1:Vector.<§_-63Q§>) : void
      {
         var _loc2_:Vector.<§_-63Q§> = null;
         var _loc3_:§_-63Q§ = null;
         var _loc4_:int = 0;
         for each(_loc3_ in param1)
         {
            _loc2_ = _loc3_ is GameBody ? this.§_-12X§ : this.§_-6y§;
            _loc4_ = _loc2_.indexOf(_loc3_);
            if(_loc4_ == -1 && Boolean(_loc3_))
            {
               _loc2_.push(_loc3_);
            }
            else
            {
               this.§_-du§(_loc3_ as §_-R2Z§);
            }
         }
         this.§_-K2C§();
      }
      
      public function §_-du§(param1:§_-R2Z§) : void
      {
         var _loc2_:Vector.<§_-63Q§> = param1 is GameBody ? this.§_-12X§ : this.§_-6y§;
         var _loc3_:int = _loc2_.indexOf(param1 as §_-63Q§);
         if(_loc3_ == -1)
         {
            return;
         }
         _loc2_.splice(_loc3_,1);
         this.§_-K2C§();
      }
      
      public function §_-M1A§() : void
      {
         var _loc1_:§_-63Q§ = null;
         for each(_loc1_ in this.§_-6y§.concat(this.§_-12X§))
         {
            if(_loc1_ != null)
            {
               (_loc1_ as §_-R2Z§).§_-du§(this);
            }
         }
         this.§_-6y§ = new Vector.<§_-63Q§>();
         this.§_-12X§ = new Vector.<§_-63Q§>();
      }
      
      public function §_-K2C§() : void
      {
         var _loc4_:§_-63Q§ = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc1_:int = this.x;
         var _loc2_:int = this.y;
         var _loc3_:Shape = new Shape();
         while(this.§_-i1U§.numChildren > 0)
         {
            this.§_-i1U§.§_-n2T§(0);
         }
         _loc3_.graphics.lineStyle(2,16777215);
         this.§_-i1U§.rotation = -this.rotation;
         for each(_loc4_ in this.§_-6y§.concat(this.§_-12X§))
         {
            if(_loc4_ != null)
            {
               _loc5_ = (_loc4_ as §_-h2I§).x - _loc1_;
               _loc6_ = (_loc4_ as §_-h2I§).y - _loc2_;
               _loc3_.graphics.moveTo(0,0);
               _loc3_.graphics.lineTo(_loc5_,_loc6_);
            }
         }
         if(!this.§_-C1B§)
         {
            return;
         }
         this.§_-S1v§.removeFromParent();
         this.§_-S1v§ = new §_-h2I§(_loc3_);
         this.§_-i1U§.§_-83v§(this.§_-S1v§);
      }
      
      protected function §_-w2c§() : void
      {
         var _loc1_:§_-63Q§ = null;
         if(!this.§_-C1B§)
         {
            return;
         }
         this.§_-K2C§();
         for each(_loc1_ in this.§_-6y§.concat(this.§_-12X§))
         {
            if(_loc1_ != null)
            {
               (_loc1_ as §_-R2Z§).§_-K2C§();
            }
         }
      }
   }
}

