package §_-o10§
{
   import §_-X2V§.SquirrelEvent;
   import §_-c2C§.§_-u24§;
   import §_-cm§.§_-Q2h§;
   import §_-n1h§.Perk;
   import flash.display.SimpleButton;
   import flash.utils.getDefinitionByName;
   
   public class §_-p1B§ extends Perk
   {
      
      public static const §_-32w§:int = 3;
      
      public var §_-f1V§:int;
      
      public var §_-41Z§:int;
      
      protected var buff:§_-Q2h§ = null;
      
      public function §_-p1B§(param1:Hero, param2:Array)
      {
         super(param1);
         this.§_-f1V§ = param2[0];
         this.§_-41Z§ = param2[1];
         this.hero.addEventListener(SquirrelEvent.§_-Z2N§,this.§_-BS§);
      }
      
      public static function §_-311§(param1:int, param2:int, param3:Object) : Number
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
         return super.available && this.hero.shaman && §_-u24§.mode != §_-at§.§_-F15§;
      }
      
      override public function dispose() : void
      {
         if(this.hero)
         {
            this.hero.removeEventListener(SquirrelEvent.§_-Z2N§,this.§_-BS§);
         }
         super.dispose();
      }
      
      override public function §_-xm§() : void
      {
         this.reset();
         this.§_-v2d§ = 0;
      }
      
      override public function get switchable() : Boolean
      {
         return true;
      }
      
      override public function §_-V1z§() : void
      {
      }
      
      override protected function onComplete() : void
      {
      }
      
      public function reset() : void
      {
         this.active = false;
         this.isBlock = false;
         this.§_-G27§ = this.startCooldown;
         §_-O25§();
      }
      
      public function get §_-53U§() : Boolean
      {
         return this.§_-41Z§ == §_-32w§;
      }
      
      protected function §_-BS§(param1:SquirrelEvent) : void
      {
      }
      
      protected function §_-bx§() : Number
      {
         return §_-311§(this.§_-f1V§,this.§_-41Z§,§_-pl§.perkData[this.§_-T2a§]["bonuses"]);
      }
      
      protected function §_-s2t§() : Number
      {
         return §_-311§(this.§_-f1V§,this.§_-41Z§,§_-pl§.perkData[this.§_-T2a§]["extraBonuses"]);
      }
      
      protected function §_-K5§(param1:Number) : §_-Q2h§
      {
         var _loc2_:String = "<b/>" + §_-pl§.perkData[this.§_-T2a§]["name"] + "</b>";
         if(this.hero.isSelf)
         {
            _loc2_ += this is §_-S2w§ ? "" : "<br/>" + §_-pl§.§_-O2e§(this.§_-T2a§,§_-pl§.§_-zl§,[this.§_-f1V§,this.§_-41Z§]);
         }
         else
         {
            _loc2_ += "<br/>" + §_-pl§.§_-O2e§(this.§_-T2a§,§_-pl§.§_-R2N§,[this.§_-f1V§,this.§_-41Z§]);
         }
         return new §_-Q2h§((new §_-pl§.perkData[this.§_-T2a§]["buttonClass"]() as SimpleButton).upState,0.7,param1,_loc2_);
      }
   }
}

