package §_-t14§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-X1k§.§_-P2x§;
   import §_-X1k§.§_-gU§;
   import §_-v2M§.§_-A3f§;
   import §_-v2M§.§_-f1C§;
   import events.§_-Um§;
   import events.§_-X8§;
   import flash.utils.setTimeout;
   import game.mainGame.SquirrelGame;
   
   public class §_-62O§ extends SquirrelGame
   {
      
      public static const §_-q4§:int = §_-A3f§.§_-73z§ - 1;
      
      public static const §_-M1I§:int = §_-q4§ - 1;
      
      private const §_-BZ§:Array;
      
      public var §_-OA§:§_-j2w§;
      
      private var §_-G1r§:§_-j2w§;
      
      private var shaman:§_-j2w§;
      
      private var scrat:§_-112§;
      
      private var §_-X2A§:§_-b2H§;
      
      public function §_-62O§()
      {
         this.§_-BZ§ = [[this.§_-i2q§],[this.§_-Wy§,this.§_-R2c§],[this.§_-KE§],[this.§_-Wy§],[this.§_-Wy§],[this.§_-01U§]];
         this.map = new §_-C2A§(this);
         this.squirrels = new §_-c2§();
         this.cast = new §_-f1C§(this);
         super();
      }
      
      public function start() : void
      {
         this.§_-d§ = false;
         addEventListener(§_-X8§.§_-n2H§,this.§_-gk§);
         this.squirrels.clear();
         this.squirrels.add(Game.selfId);
         this.squirrels.add(§_-A3f§.§_-73z§);
         this.squirrels.add(§_-q4§);
         this.squirrels.reset();
         this.squirrels.§_-J1N§([§_-A3f§.§_-73z§]);
         this.squirrels.place();
         this.squirrels.show();
         this.§_-d§ = true;
         this.§_-OA§ = this.squirrels.get(§_-q4§) as §_-j2w§;
         this.§_-OA§.position = new b2Vec2(1576 / Game.§_-12A§,354 / Game.§_-12A§);
         this.§_-OA§.heroView.sendMessage(gls("Моя коллекция, моя!"),0);
         this.§_-OA§.§_-N1Z§([§_-P2x§.§_-i0§],[§_-P2x§.§_-nC§,§_-P2x§.§_-BT§,§_-P2x§.§_-X14§]);
         this.§_-OA§.§_-Y1v§ = true;
         this.shaman = this.squirrels.§_-wt§()[0] as §_-j2w§;
         this.shaman.heroView.§_-f29§.playerName = gls("Шаман");
         this.shaman.heroView.§_-f29§.league = 0;
         this.shaman.heroView.§_-f29§.redraw();
         this.§_-G1r§ = Hero.self as §_-j2w§;
         this.§_-G1r§.addEventListener(§_-Um§.§_-9q§,this.§_-WB§,false,0,true);
         this.shaman.§_-dP§();
         §_-Q2X§.start();
         Game.stage.focus = Game.stage;
      }
      
      public function §_-i2X§() : void
      {
         this.§_-Wy§();
         this.§_-OA§.§_-i2X§();
         if(this.shaman.§_-T3§ == 3)
         {
            this.shaman.§_-u2s§ = true;
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
            this.§_-vN§();
         }
      }
      
      public function finish() : void
      {
         this.§_-Wy§();
      }
      
      private function §_-WB§(param1:§_-Um§) : void
      {
         var _loc2_:int = Math.abs(this.shaman.id);
         this.shaman.heroView.sendMessage(§_-gU§.§_-B3u§(_loc2_,§_-gU§.§_-11p§(_loc2_,this.shaman.§_-T3§)[0]));
         this.§_-G1r§.teleportTo(this.map.§_-K2H§);
         this.§_-G1r§.respawn();
         §_-Q2X§.dead();
      }
      
      private function §_-gk§(param1:§_-X8§) : void
      {
         var _loc2_:Function = null;
         for each(_loc2_ in this.§_-BZ§[param1.§_-T3§])
         {
            _loc2_.apply();
         }
      }
      
      private function §_-Wy§() : void
      {
         var _loc1_:§_-j2w§ = null;
         for each(_loc1_ in this.squirrels.players)
         {
            _loc1_.§_-A1L§ = false;
         }
      }
      
      private function §_-KE§() : void
      {
         this.§_-X2A§ = new §_-b2H§();
         this.§_-X2A§.§_-33§(gls("АААААААААААААА!"),0);
         this.§_-X2A§.y = -100;
         this.scrat = new §_-112§();
         this.scrat.setState(Hero.§_-l19§);
         this.scrat.x = 2512;
         this.scrat.scaleX *= -1;
         this.scrat.addChild(this.§_-X2A§);
         this.map.addChild(this.scrat);
         this.map.§_-J2J§(this.scrat);
      }
      
      private function §_-vN§() : void
      {
         this.scrat.removeChild(this.§_-X2A§);
         this.§_-X2A§.dispose();
         this.§_-X2A§ = null;
         this.map.removeChild(this.scrat);
         this.map.removeChildStarling(this.scrat);
         this.scrat.remove();
         this.scrat = null;
      }
      
      private function §_-i2q§() : void
      {
         this.§_-Wy§();
         this.shaman.§_-dP§();
      }
      
      private function §_-01U§() : void
      {
         this.§_-Wy§();
         setTimeout(this.§_-OA§.heroView.sendMessage,5000,gls("Спасибо за помощь, шаман! Ещё увидимся!"));
      }
      
      private function §_-R2c§() : void
      {
         setTimeout(this.shaman.heroView.sendMessage,500,gls("Отлично."));
      }
   }
}

