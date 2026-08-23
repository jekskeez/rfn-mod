package §_-cm§
{
   import §_-L2E§.§_-h2t§;
   import §_-c2C§.§_-u24§;
   import §_-cA§.§_-3b§;
   import §_-cA§.§_-Cq§;
   import §_-td§.§_-vO§;
   import flash.events.Event;
   import flash.filters.DropShadowFilter;
   import flash.text.TextFormat;
   import game.mainGame.§_-43R§;
   import game.mainGame.§_-R2b§;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import views.§_-Y2g§;
   
   public class §_-cV§ extends §_-vO§ implements §_-R2b§
   {
      
      private static const §_-W2P§:TextFormat = new TextFormat(§_-i5§.§_-c10§,30,16777215,true,null,null,null,null,"center");
      
      private static const §_-21n§:DropShadowFilter = new DropShadowFilter(0,0,3022854,1,3,3,8);
      
      private static var §_-03J§:§_-h2t§ = null;
      
      public var §_-b1o§:§_-Y2g§ = null;
      
      private var §_-P1c§:ScoreFlagBlue = null;
      
      private var §_-sm§:ScoreFlagRed = null;
      
      private var §_-h1h§:§_-i5§ = null;
      
      private var §_-51e§:§_-i5§ = null;
      
      public function §_-cV§()
      {
         super();
         this.§_-P1c§ = new ScoreFlagBlue();
         this.§_-P1c§.x = 157;
         addChild(this.§_-P1c§);
         this.§_-sm§ = new ScoreFlagRed();
         this.§_-sm§.x = int(Game.starling.stage.stageWidth - 204);
         addChild(this.§_-sm§);
         this.§_-h1h§ = new §_-i5§("",-1,40,§_-W2P§,47);
         this.§_-h1h§.filters = [§_-21n§];
         this.§_-P1c§.addChild(this.§_-h1h§);
         this.§_-51e§ = new §_-i5§("",-1,40,§_-W2P§,47);
         this.§_-51e§.filters = [§_-21n§];
         this.§_-sm§.addChild(this.§_-51e§);
         this.§_-b1o§ = new §_-Y2g§();
         this.§_-b1o§.onComplete = this.§_-G1t§;
         Game.§_-q1L§.addChild(this.§_-b1o§);
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-C2v§,§_-s2l§.§_-v1r§],1);
         §_-73Q§.addEventListener(§_-73Q§.§_-J1D§,this.§_-22v§);
         this.§_-22v§();
      }
      
      override public function round(param1:Array) : void
      {
         super.round(param1);
         this.§_-2p§();
         switch(param1[0])
         {
            case §_-s2l§.ROUND_STARTING:
               this.§_-51e§.text = "0";
               this.§_-h1h§.text = "0";
               if(this.§_-g1o§)
               {
                  this.§_-g1o§.hide();
               }
               break;
            case §_-s2l§.§_-02x§:
               if(§_-u24§.§_-j2T§ == 0)
               {
                  this.§_-b2U§();
               }
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
         if(Game.§_-q1L§.contains(this.§_-b1o§))
         {
            Game.§_-q1L§.removeChild(this.§_-b1o§);
         }
         this.§_-2p§();
         Connection.forget(this.§_-x2f§,[§_-s2l§.§_-C2v§,§_-s2l§.§_-v1r§]);
         §_-73Q§.removeEventListener(§_-73Q§.§_-J1D§,this.§_-22v§);
      }
      
      override public function update(param1:Number) : void
      {
         super.update(param1);
         this.§_-b1o§.update(param1);
      }
      
      public function §_-PK§() : Array
      {
         return [int(this.§_-51e§.text),int(this.§_-h1h§.text)];
      }
      
      public function §_-2p§() : void
      {
         this.§_-b1o§.stop();
      }
      
      override protected function init() : void
      {
         this.cast = new §_-Tv§(this);
         this.map = new §_-P2r§(this);
         this.squirrels = new §_-A1A§();
         §_-12U§ = this.§_-g1o§;
      }
      
      override protected function §_-Q2Q§() : void
      {
      }
      
      override protected function §_-23R§() : void
      {
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         switch(param1.type)
         {
            case §_-s2l§.§_-C2v§:
               this.§_-51e§.text = param1[0];
               this.§_-h1h§.text = param1[0];
               break;
            case §_-s2l§.§_-v1r§:
               if(Game.§_-t2I§(param1[0]) && "4" in param1 && param1[4] == Game.selfId)
               {
                  Connection.§_-e2T§(§_-u1O§.§_-g2w§,§_-6v§.§_-e2V§,1);
               }
               switch(this.squirrels.get(param1[0]).team)
               {
                  case Hero.§_-i1Y§:
                     this.§_-51e§.text = String(int(this.§_-51e§.text) + 1);
                     break;
                  case Hero.§_-l1B§:
                     this.§_-h1h§.text = String(int(this.§_-h1h§.text) + 1);
               }
               if(Boolean(param1[0] != Game.selfId && Hero.self && !Hero.self.isHare) && Boolean(!Hero.self.isDragon) && !Hero.self.§_-Ha§)
               {
                  return;
               }
               this.§_-b1o§.start();
         }
      }
      
      private function §_-G1t§() : void
      {
         Connection.§_-e2T§(§_-u1O§.§_-N1Y§);
      }
      
      private function §_-22v§(param1:Event = null) : void
      {
         this.§_-sm§.x = Game.starling.stage.stageWidth - 204;
         this.§_-b1o§.§_-ZU§();
      }
      
      private function §_-b2U§() : void
      {
         var _loc1_:Array = this.§_-PK§();
         var _loc2_:Array = (this.squirrels as §_-43R§).§_-WO§;
         var _loc3_:Array = (this.squirrels as §_-43R§).§_-Z2D§;
         var _loc4_:Vector.<§_-3b§> = new Vector.<§_-3b§>();
         var _loc5_:Vector.<§_-3b§> = new Vector.<§_-3b§>();
         this.§_-93z§(_loc2_,_loc4_,Hero.§_-l1B§);
         this.§_-93z§(_loc3_,_loc5_,Hero.§_-i1Y§);
         this.§_-g1o§.§_-n1S§();
         this.§_-g1o§.§_-o2y§(_loc4_,_loc5_);
         this.§_-g1o§.§_-nu§(_loc1_,Hero.self.team);
         this.§_-g1o§.show();
      }
      
      private function §_-93z§(param1:Array, param2:Vector.<§_-3b§>, param3:int) : void
      {
         var _loc4_:int = 0;
         var _loc5_:Hero = null;
         for each(_loc4_ in param1)
         {
            _loc5_ = this.squirrels.get(_loc4_);
            if(_loc5_)
            {
               param2.push(new §_-Cq§(_loc5_.player,_loc5_.frags,param3));
            }
         }
      }
      
      private function get §_-g1o§() : §_-h2t§
      {
         return §_-03J§ = §_-03J§ || new §_-h2t§();
      }
   }
}

