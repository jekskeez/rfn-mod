package §_-I1q§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-A1G§.§_-w10§;
   import §_-TK§.§_-aS§;
   import §_-TK§.§_-f1u§;
   import sounds.GameSounds;
   
   public class §_-C3Q§ extends §_-r2T§
   {
      
      public function §_-C3Q§()
      {
         super();
         this.view = new §_-aS§(new SheepBombView());
         this.view.scaleXY(0.5,0.5);
         this.view.§_-i18§();
         §_-J2J§(this.view);
         this.§_-e20§ = new §_-f1u§(new SheepBombExplodeView());
         this.§_-e20§.scaleXY(0.5,0.5);
         this.§_-e20§.visible = false;
         this.§_-e20§.stop();
         this.§_-e20§.x = -9;
         this.§_-e20§.y = -17;
         §_-J2J§(this.§_-e20§);
      }
      
      override protected function §_-M1S§() : void
      {
         var target:Hero = null;
         try
         {
            GameSounds.play("teleport");
            target = this.§_-21H§.squirrels.get(this.playerId);
            target.§_-r1C§(new b2Vec2(this.position.x,this.position.y));
            target.sendLocation();
         }
         catch(e:Error)
         {
            §_-p2U§.add("Error" + e.getStackTrace());
         }
      }
      
      override protected function get effectName() : String
      {
         return §_-w10§.§_-i2L§;
      }
   }
}

