package §_-vK§
{
   import §_-8I§.SquirrelEvent;
   import §_-S2§.Perk;
   import §_-T1r§.§_-03i§;
   import §_-T2y§.§_-92z§;
   import flash.display.SimpleButton;
   import flash.utils.getDefinitionByName;
   
   public class §_-qC§ extends Perk
   {
      
      public static const §_-sO§:int = 3;
      
      public var §_-e1P§:int;
      
      public var §_-d1K§:int;
      
      protected var buff:§_-03i§ = null;
      
      public function §_-qC§(param1:Hero, param2:Array)
      {
         super(param1);
         this.§_-e1P§ = param2[0];
         this.§_-d1K§ = param2[1];
         this.hero.addEventListener(SquirrelEvent.§_-S2i§,this.§_-S2Z§);
      }
      
      public static function §_-zk§(param1:int, param2:int, param3:Object) : Number
      {
         var _loc4_:Number = 0;
         var _loc5_:int = 0;
         while(_loc5_ < param1)
         {
            _loc4_ += param3["free"][_loc5_];
            _loc5_++;
         }
         _loc5_ = 0;
         while(_loc5_ < param2)
         {
            _loc4_ += param3["paid"][_loc5_];
            _loc5_++;
         }
         return _loc4_;
      }
      
      override public function get available() : Boolean
      {
         return super.available && this.hero.shaman && §_-92z§.mode != §_-q1p§.§_-w1Y§;
      }
      
      override public function dispose() : void
      {
         if(this.hero)
         {
            this.hero.removeEventListener(SquirrelEvent.§_-S2i§,this.§_-S2Z§);
         }
         super.dispose();
      }
      
      override public function §_-S2A§() : void
      {
         this.reset();
         this.§_-D1n§ = 0;
      }
      
      override public function get switchable() : Boolean
      {
         return true;
      }
      
      override public function §_-7J§() : void
      {
      }
      
      override protected function onComplete() : void
      {
      }
      
      public function reset() : void
      {
         this.active = false;
         this.isBlock = false;
         this.§_-3V§ = this.startCooldown;
         §_-Py§();
      }
      
      public function get §_-41W§() : Boolean
      {
         return this.§_-d1K§ == §_-sO§;
      }
      
      protected function §_-S2Z§(param1:SquirrelEvent) : void
      {
      }
      
      protected function §_-Nu§() : Number
      {
         return §_-zk§(this.§_-e1P§,this.§_-d1K§,§_-QC§.perkData[this.§_-i2D§]["bonuses"]);
      }
      
      protected function §_-OD§() : Number
      {
         return §_-zk§(this.§_-e1P§,this.§_-d1K§,§_-QC§.perkData[this.§_-i2D§]["extraBonuses"]);
      }
      
      protected function §_-T1G§(param1:Number) : §_-03i§
      {
         var _loc2_:String = "<b/>" + §_-QC§.perkData[this.§_-i2D§]["name"] + "</b>";
         if(this.hero.isSelf)
         {
            _loc2_ += this is §_-21O§ ? "" : "<br/>" + §_-QC§.§_-03v§(this.§_-i2D§,§_-QC§.§_-W2r§,[this.§_-e1P§,this.§_-d1K§]);
         }
         else
         {
            _loc2_ += "<br/>" + §_-QC§.§_-03v§(this.§_-i2D§,§_-QC§.§_-O2B§,[this.§_-e1P§,this.§_-d1K§]);
         }
         return new §_-03i§((new §_-QC§.perkData[this.§_-i2D§]["buttonClass"]() as SimpleButton).upState,0.7,param1,_loc2_);
      }
   }
}

