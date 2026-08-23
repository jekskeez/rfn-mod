package §_-P2b§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-33r§.§_-R§;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class §_-5u§ extends §_-H2N§
   {
      
      private static const §_-I1D§:int = 1;
      
      private static const §_-x9§:int = 2;
      
      private static const §_-c1F§:Number = 8;
      
      private static const §_-63M§:int = 12;
      
      private static const §_-U1o§:int = 1;
      
      private static const §_-23E§:int = 2;
      
      private var view:MovieClip;
      
      public function §_-5u§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = §_-iP§;
         this.view = new NewYearYetiView();
         this.view.stop();
         this.view.scaleX = this.view.scaleY = 1.2;
         this.view.addEventListener("Stomp",this.§_-u2p§);
         this.view.addEventListener(Event.CHANGE,this.§_-bY§);
      }
      
      override public function get maxCountUse() : int
      {
         return Boolean(this.hero) && this.§_-j2Y§ >= §_-x9§ ? §_-23E§ : §_-U1o§;
      }
      
      override public function get totalCooldown() : Number
      {
         return 90;
      }
      
      override public function get available() : Boolean
      {
         return super.available && !this.active && !this.hero.heroView.§_-k2P§;
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
         this.hero.game.map.§_-X1H§.addChild(this.view);
         this.view.gotoAndPlay(0);
         this.active = false;
      }
      
      private function §_-u2p§(param1:Event) : void
      {
         var _loc3_:Hero = null;
         var _loc4_:b2Vec2 = null;
         if(!this.hero || !this.hero.game || !this.hero.game.squirrels)
         {
            return;
         }
         var _loc2_:Number = Boolean(this.hero) && this.§_-j2Y§ >= §_-I1D§ ? §_-63M§ : §_-c1F§;
         for each(_loc3_ in this.hero.game.squirrels.players)
         {
            if(_loc3_ != this.hero)
            {
               _loc4_ = _loc3_.position.Copy();
               _loc4_.Subtract(new b2Vec2(this.view.x / Game.§_-x2P§,this.view.y / Game.§_-x2P§));
               if(_loc4_.Length() <= _loc2_)
               {
                  _loc3_.behaviourController.§_-gz§(new §_-R§(3));
               }
            }
         }
      }
      
      private function §_-bY§(param1:Event) : void
      {
         if(!this.view)
         {
            return;
         }
         this.view.stop();
         if(this.hero.game.map.§_-X1H§.contains(this.view))
         {
            this.hero.game.map.§_-X1H§.removeChild(this.view);
         }
      }
   }
}

