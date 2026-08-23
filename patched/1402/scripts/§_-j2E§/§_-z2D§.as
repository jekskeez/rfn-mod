package §_-j2E§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-Cc§.§_-F1B§;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class §_-z2D§ extends §_-92f§
   {
      
      private static const §_-sz§:int = 1;
      
      private static const §_-s1Q§:int = 2;
      
      private static const §_-A2L§:Number = 8;
      
      private static const §_-Y2w§:int = 12;
      
      private static const §_-Ea§:int = 1;
      
      private static const §_-UA§:int = 2;
      
      private var view:MovieClip;
      
      public function §_-z2D§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = §_-VF§;
         this.view = new NewYearYetiView();
         this.view.stop();
         this.view.scaleX = this.view.scaleY = 1.2;
         this.view.addEventListener("Stomp",this.§_-m2h§);
         this.view.addEventListener(Event.CHANGE,this.§_-TZ§);
      }
      
      override public function get maxCountUse() : int
      {
         return Boolean(this.hero) && this.§_-32l§ >= §_-s1Q§ ? §_-UA§ : §_-Ea§;
      }
      
      override public function get totalCooldown() : Number
      {
         return 90;
      }
      
      override public function get available() : Boolean
      {
         return super.available && !this.active && !this.hero.heroView.§_-52A§;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.view = null;
      }
      
      override protected function activate() : void
      {
         super.activate();
         if(!this.hero.game || this.hero.game.paused)
         {
            this.active = false;
            return;
         }
         var _loc1_:Point = this.hero.getPosition();
         this.view.x = _loc1_.x;
         this.view.y = _loc1_.y + 20;
         this.hero.game.map.§_-o1i§.addChild(this.view);
         this.view.gotoAndPlay(0);
         this.active = false;
      }
      
      private function §_-m2h§(param1:Event) : void
      {
         var _loc3_:Hero = null;
         var _loc4_:b2Vec2 = null;
         if(!this.hero || !this.hero.game || !this.hero.game.squirrels)
         {
            return;
         }
         var _loc2_:Number = Boolean(this.hero) && this.§_-32l§ >= §_-sz§ ? §_-Y2w§ : §_-A2L§;
         for each(_loc3_ in this.hero.game.squirrels.players)
         {
            if(_loc3_ != this.hero)
            {
               _loc4_ = _loc3_.position.Copy();
               _loc4_.Subtract(new b2Vec2(this.view.x / Game.§_-12A§,this.view.y / Game.§_-12A§));
               if(_loc4_.Length() <= _loc2_)
               {
                  _loc3_.behaviourController.§_-W10§(new §_-F1B§(3));
               }
            }
         }
      }
      
      private function §_-TZ§(param1:Event) : void
      {
         if(!this.view)
         {
            return;
         }
         this.view.stop();
         if(this.hero.game.map.§_-o1i§.contains(this.view))
         {
            this.hero.game.map.§_-o1i§.removeChild(this.view);
         }
      }
   }
}

