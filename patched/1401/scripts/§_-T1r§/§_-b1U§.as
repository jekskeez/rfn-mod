package §_-T1r§
{
   import §_-A2x§.§_-Ar§;
   import §_-T2y§.§_-92z§;
   import §_-X1o§.§_-Lf§;
   import §_-X1o§.§_-X27§;
   import §_-uh§.§_-M2o§;
   import flash.events.Event;
   import flash.filters.DropShadowFilter;
   import flash.text.TextFormat;
   import game.mainGame.§_-Fd§;
   import game.mainGame.§_-ME§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   import views.§_-W15§;
   
   public class §_-b1U§ extends §_-Ar§ implements §_-Fd§
   {
      
      private static const §_-i2c§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,30,16777215,true,null,null,null,null,"center");
      
      private static const §_-b23§:DropShadowFilter = new DropShadowFilter(0,0,3022854,1,3,3,8);
      
      private static var §_-xN§:§_-M2o§ = null;
      
      public var §_-T17§:§_-W15§ = null;
      
      private var §_-UM§:ScoreFlagBlue = null;
      
      private var §_-721§:ScoreFlagRed = null;
      
      private var §_-i2u§:§_-22V§ = null;
      
      private var §_-Gf§:§_-22V§ = null;
      
      public function §_-b1U§()
      {
         super();
         this.§_-UM§ = new ScoreFlagBlue();
         this.§_-UM§.x = 157;
         addChild(this.§_-UM§);
         this.§_-721§ = new ScoreFlagRed();
         this.§_-721§.x = int(Game.starling.stage.stageWidth - 204);
         addChild(this.§_-721§);
         this.§_-i2u§ = new §_-22V§("",-1,40,§_-i2c§,47);
         this.§_-i2u§.filters = [§_-b23§];
         this.§_-UM§.addChild(this.§_-i2u§);
         this.§_-Gf§ = new §_-22V§("",-1,40,§_-i2c§,47);
         this.§_-Gf§.filters = [§_-b23§];
         this.§_-721§.addChild(this.§_-Gf§);
         this.§_-T17§ = new §_-W15§();
         this.§_-T17§.onComplete = this.§_-p2G§;
         Game.§_-d2t§.addChild(this.§_-T17§);
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-z1E§,§_-S2I§.§_-F2m§],1);
         §_-K1r§.addEventListener(§_-K1r§.§_-n2V§,this.§_-V1Q§);
         this.§_-V1Q§();
      }
      
      override public function round(param1:Array) : void
      {
         super.round(param1);
         this.§_-P25§();
         switch(param1[0])
         {
            case §_-S2I§.ROUND_STARTING:
               this.§_-Gf§.text = "0";
               this.§_-i2u§.text = "0";
               if(this.§_-es§)
               {
                  this.§_-es§.hide();
               }
               break;
            case §_-S2I§.§_-RO§:
               if(§_-92z§.§_-32S§ == 0)
               {
                  this.§_-t1W§();
               }
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
         if(Game.§_-d2t§.contains(this.§_-T17§))
         {
            Game.§_-d2t§.removeChild(this.§_-T17§);
         }
         this.§_-P25§();
         Connection.forget(this.§_-o2C§,[§_-S2I§.§_-z1E§,§_-S2I§.§_-F2m§]);
         §_-K1r§.removeEventListener(§_-K1r§.§_-n2V§,this.§_-V1Q§);
      }
      
      override public function update(param1:Number) : void
      {
         super.update(param1);
         this.§_-T17§.update(param1);
      }
      
      public function §_-4G§() : Array
      {
         return [int(this.§_-Gf§.text),int(this.§_-i2u§.text)];
      }
      
      public function §_-P25§() : void
      {
         this.§_-T17§.stop();
      }
      
      override protected function init() : void
      {
         this.cast = new §_-Q2n§(this);
         this.map = new §_-r1t§(this);
         this.squirrels = new §_-l1F§();
         §_-93L§ = this.§_-es§;
      }
      
      override protected function §_-G1a§() : void
      {
      }
      
      override protected function §_-e1D§() : void
      {
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         switch(param1.type)
         {
            case §_-S2I§.§_-z1E§:
               this.§_-Gf§.text = param1[0];
               this.§_-i2u§.text = param1[0];
               break;
            case §_-S2I§.§_-F2m§:
               if(Game.§_-aC§(param1[0]) && "4" in param1 && param1[4] == Game.selfId)
               {
                  Connection.§_-Li§(§_-h2B§.§_-41H§,§_-J2r§.§_-4w§,1);
               }
               switch(this.squirrels.get(param1[0]).team)
               {
                  case Hero.§_-114§:
                     this.§_-Gf§.text = String(int(this.§_-Gf§.text) + 1);
                     break;
                  case Hero.§_-17§:
                     this.§_-i2u§.text = String(int(this.§_-i2u§.text) + 1);
               }
               if(Boolean(param1[0] != Game.selfId && Hero.self && !Hero.self.isHare) && Boolean(!Hero.self.isDragon) && !Hero.self.§_-la§)
               {
                  return;
               }
               this.§_-T17§.start();
         }
      }
      
      private function §_-p2G§() : void
      {
         Connection.§_-Li§(§_-h2B§.§_-03G§);
      }
      
      private function §_-V1Q§(param1:Event = null) : void
      {
         this.§_-721§.x = Game.starling.stage.stageWidth - 204;
         this.§_-T17§.§_-l13§();
      }
      
      private function §_-t1W§() : void
      {
         var _loc1_:Array = this.§_-4G§();
         var _loc2_:Array = (this.squirrels as §_-ME§).§_-v2G§;
         var _loc3_:Array = (this.squirrels as §_-ME§).§_-J23§;
         var _loc4_:Vector.<§_-X27§> = new Vector.<§_-X27§>();
         var _loc5_:Vector.<§_-X27§> = new Vector.<§_-X27§>();
         this.§_-wH§(_loc2_,_loc4_,Hero.§_-17§);
         this.§_-wH§(_loc3_,_loc5_,Hero.§_-114§);
         this.§_-es§.§_-sz§();
         this.§_-es§.§_-I1K§(_loc4_,_loc5_);
         this.§_-es§.§_-X2t§(_loc1_,Hero.self.team);
         this.§_-es§.show();
      }
      
      private function §_-wH§(param1:Array, param2:Vector.<§_-X27§>, param3:int) : void
      {
         var _loc4_:int = 0;
         var _loc5_:Hero = null;
         for each(_loc4_ in param1)
         {
            _loc5_ = this.squirrels.get(_loc4_);
            if(_loc5_)
            {
               param2.push(new §_-Lf§(_loc5_.player,_loc5_.frags,param3));
            }
         }
      }
      
      private function get §_-es§() : §_-M2o§
      {
         return §_-xN§ = §_-xN§ || new §_-M2o§();
      }
   }
}

