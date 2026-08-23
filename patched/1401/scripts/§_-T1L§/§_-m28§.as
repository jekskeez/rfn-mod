package §_-t1l§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-F1E§.§_-41e§;
   import §_-F1E§.§_-P1i§;
   import §_-I10§.§_-C3U§;
   import §_-I10§.§_-g2W§;
   import events.§_-03Q§;
   import events.§_-Wh§;
   import flash.utils.setTimeout;
   import game.mainGame.SquirrelGame;
   
   public class §_-m28§ extends SquirrelGame
   {
      
      public static const §_-H1b§:int = §_-41e§.§_-C28§ - 1;
      
      public static const §_-d14§:int = §_-H1b§ - 1;
      
      private const §_-Q1u§:Array;
      
      public var §_-wM§:§_-Y1w§;
      
      private var §_-B1i§:§_-Y1w§;
      
      private var shaman:§_-Y1w§;
      
      private var scrat:§_-YF§;
      
      private var §_-oh§:§_-sF§;
      
      public function §_-m28§()
      {
         this.§_-Q1u§ = [[this.§_-Kv§],[this.§_-83p§,this.§_-U2s§],[this.§_-I2x§],[this.§_-83p§],[this.§_-83p§],[this.§_-N1u§]];
         this.map = new §_-E10§(this);
         this.squirrels = new §_-C1s§();
         this.cast = new §_-P1i§(this);
         super();
      }
      
      public function start() : void
      {
         this.§_-j1L§ = false;
         addEventListener(§_-03Q§.§_-31q§,this.§_-c13§);
         this.squirrels.clear();
         this.squirrels.add(Game.selfId);
         this.squirrels.add(§_-41e§.§_-C28§);
         this.squirrels.add(§_-H1b§);
         this.squirrels.reset();
         this.squirrels.§_-B1q§([§_-41e§.§_-C28§]);
         this.squirrels.place();
         this.squirrels.show();
         this.§_-j1L§ = true;
         this.§_-wM§ = this.squirrels.get(§_-H1b§) as §_-Y1w§;
         this.§_-wM§.position = new b2Vec2(1576 / Game.§_-x2P§,354 / Game.§_-x2P§);
         this.§_-wM§.heroView.sendMessage(gls("Моя коллекция, моя!"),0);
         this.§_-wM§.§_-83Y§([§_-g2W§.§_-v1V§],[§_-g2W§.§_-Z2h§,§_-g2W§.§_-i3§,§_-g2W§.§_-824§]);
         this.§_-wM§.§_-a2r§ = true;
         this.shaman = this.squirrels.§_-K14§()[0] as §_-Y1w§;
         this.shaman.heroView.§_-S23§.playerName = gls("Шаман");
         this.shaman.heroView.§_-S23§.league = 0;
         this.shaman.heroView.§_-S23§.redraw();
         this.§_-B1i§ = Hero.self as §_-Y1w§;
         this.§_-B1i§.addEventListener(§_-Wh§.§_-63w§,this.§_-H1L§,false,0,true);
         this.shaman.§_-L1C§();
         §_-EX§.start();
         Game.stage.focus = Game.stage;
      }
      
      public function §_-K1E§() : void
      {
         this.§_-83p§();
         this.§_-wM§.§_-K1E§();
         if(this.shaman.§_-TE§ == 3)
         {
            this.shaman.§_-83U§ = true;
         }
      }
      
      override public function update(param1:Number) : void
      {
         super.update(param1);
         if(!this.scrat)
         {
            return;
         }
         this.scrat.y += 5;
         if(this.scrat.y > this.height + 500)
         {
            this.§_-bE§();
         }
      }
      
      public function finish() : void
      {
         this.§_-83p§();
      }
      
      private function §_-H1L§(param1:§_-Wh§) : void
      {
         var _loc2_:int = Math.abs(this.shaman.id);
         this.shaman.heroView.sendMessage(§_-C3U§.§_-r1k§(_loc2_,§_-C3U§.§_-j2X§(_loc2_,this.shaman.§_-TE§)[0]));
         this.§_-B1i§.teleportTo(this.map.§_-ro§);
         this.§_-B1i§.respawn();
         §_-EX§.dead();
      }
      
      private function §_-c13§(param1:§_-03Q§) : void
      {
         var _loc2_:Function = null;
         for each(_loc2_ in this.§_-Q1u§[param1.§_-TE§])
         {
            _loc2_.apply();
         }
      }
      
      private function §_-83p§() : void
      {
         var _loc1_:§_-Y1w§ = null;
         for each(_loc1_ in this.squirrels.players)
         {
            _loc1_.§_-H1H§ = false;
         }
      }
      
      private function §_-I2x§() : void
      {
         this.§_-oh§ = new §_-sF§();
         this.§_-oh§.§_-BM§(gls("АААААААААААААА!"),0);
         this.§_-oh§.y = -100;
         this.scrat = new §_-YF§();
         this.scrat.setState(Hero.§_-ZP§);
         this.scrat.x = 2512;
         this.scrat.scaleX *= -1;
         this.scrat.addChild(this.§_-oh§);
         this.map.addChild(this.scrat);
         this.map.§_-83v§(this.scrat);
      }
      
      private function §_-bE§() : void
      {
         this.scrat.removeChild(this.§_-oh§);
         this.§_-oh§.dispose();
         this.§_-oh§ = null;
         this.map.removeChild(this.scrat);
         this.map.removeChildStarling(this.scrat);
         this.scrat.remove();
         this.scrat = null;
      }
      
      private function §_-Kv§() : void
      {
         this.§_-83p§();
         this.shaman.§_-L1C§();
      }
      
      private function §_-N1u§() : void
      {
         this.§_-83p§();
         setTimeout(this.§_-wM§.heroView.sendMessage,5000,gls("Спасибо за помощь, шаман! Ещё увидимся!"));
      }
      
      private function §_-U2s§() : void
      {
         setTimeout(this.shaman.heroView.sendMessage,500,gls("Отлично."));
      }
   }
}

