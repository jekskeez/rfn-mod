package §_-P2b§
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.utils.getDefinitionByName;
   import sounds.GameSounds;
   
   public class §_-DY§ extends §_-H2N§
   {
      
      private static var §_-u1Q§:Array = null;
      
      private static var §_-YZ§:Array = ["perk_new_year0","perk_new_year1"];
      
      protected var §_-N1k§:int;
      
      private var §_-53O§:Sprite;
      
      private var §_-i2g§:MovieClip;
      
      public function §_-DY§(param1:Hero)
      {
         super(param1);
         if(!§_-u1Q§)
         {
            §_-DY§.§_-u1Q§ = [NewYearSalut1,NewYearSalut2];
         }
      }
      
      override public function get totalCooldown() : Number
      {
         return 10;
      }
      
      override public function get available() : Boolean
      {
         return super.available && !this.hero.heroView.running && !this.hero.heroView.§_-k2P§ && !this.active;
      }
      
      override protected function activate() : void
      {
         super.activate();
         if(!this.hero.game)
         {
            return;
         }
         var _loc1_:Point = this.hero.getPosition();
         this.§_-53O§ = new Sprite();
         this.§_-53O§.x = _loc1_.x;
         this.§_-53O§.y = _loc1_.y;
         this.§_-53O§.rotation = this.hero.rotation;
         this.hero.game.map.userUpperSprite.addChild(this.§_-53O§);
         this.§_-i2g§ = new §_-u1Q§[this.§_-N1k§]();
         this.§_-i2g§.gotoAndPlay(0);
         this.§_-i2g§.addEventListener(Event.CHANGE,this.§_-93k§);
         this.§_-53O§.addChild(this.§_-i2g§);
         GameSounds.play(§_-YZ§[this.§_-N1k§]);
      }
      
      private function §_-93k§(param1:Event) : void
      {
         this.§_-i2g§.removeEventListener(Event.CHANGE,this.§_-93k§);
         if(this.§_-53O§.parent)
         {
            this.§_-53O§.parent.removeChild(this.§_-53O§);
         }
         this.active = false;
      }
   }
}

