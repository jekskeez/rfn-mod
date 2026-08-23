package §_-j2E§
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.utils.getDefinitionByName;
   import sounds.GameSounds;
   
   public class §_-a1f§ extends §_-92f§
   {
      
      private static var §_-Zl§:Array = null;
      
      private static var §_-320§:Array = ["perk_new_year0","perk_new_year1"];
      
      protected var §_-93O§:int;
      
      private var §_-u§:Sprite;
      
      private var §_-92h§:MovieClip;
      
      public function §_-a1f§(param1:Hero)
      {
         super(param1);
         if(!§_-Zl§)
         {
            §_-a1f§.§_-Zl§ = [NewYearSalut1,NewYearSalut2];
         }
      }
      
      override public function get totalCooldown() : Number
      {
         return 10;
      }
      
      override public function get available() : Boolean
      {
         return super.available && !this.hero.heroView.running && !this.hero.heroView.§_-52A§ && !this.active;
      }
      
      override protected function activate() : void
      {
         super.activate();
         if(!this.hero.game)
         {
            return;
         }
         var _loc1_:Point = this.hero.getPosition();
         this.§_-u§ = new Sprite();
         this.§_-u§.x = _loc1_.x;
         this.§_-u§.y = _loc1_.y;
         this.§_-u§.rotation = this.hero.rotation;
         this.hero.game.map.userUpperSprite.addChild(this.§_-u§);
         this.§_-92h§ = new §_-Zl§[this.§_-93O§]();
         this.§_-92h§.gotoAndPlay(0);
         this.§_-92h§.addEventListener(Event.CHANGE,this.§_-E1r§);
         this.§_-u§.addChild(this.§_-92h§);
         GameSounds.play(§_-320§[this.§_-93O§]);
      }
      
      private function §_-E1r§(param1:Event) : void
      {
         this.§_-92h§.removeEventListener(Event.CHANGE,this.§_-E1r§);
         if(this.§_-u§.parent)
         {
            this.§_-u§.parent.removeChild(this.§_-u§);
         }
         this.active = false;
      }
   }
}

