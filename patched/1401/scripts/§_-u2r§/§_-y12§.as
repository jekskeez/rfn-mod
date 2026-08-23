package §_-u2r§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-RI§.§_-d2d§;
   import §_-RI§.§_-h2I§;
   import §_-ZS§.§_-93d§;
   import sounds.GameSounds;
   
   public class §_-y12§ extends §_-620§
   {
      
      public function §_-y12§()
      {
         super();
         this.view = new §_-h2I§(new SheepBombView());
         this.view.scaleXY(0.5,0.5);
         this.view.§_-x2x§();
         §_-83v§(this.view);
         this.§_-h2V§ = new §_-d2d§(new SheepBombExplodeView());
         this.§_-h2V§.scaleXY(0.5,0.5);
         this.§_-h2V§.visible = false;
         this.§_-h2V§.stop();
         this.§_-h2V§.x = -9;
         this.§_-h2V§.y = -17;
         §_-83v§(this.§_-h2V§);
      }
      
      override protected function §_-GF§() : void
      {
         var target:Hero = null;
         try
         {
            GameSounds.play("teleport");
            target = this.§_-H2D§.squirrels.get(this.playerId);
            target.§_-s1§(new b2Vec2(this.position.x,this.position.y));
            target.sendLocation();
         }
         catch(e:Error)
         {
            §_-TQ§.add("Error" + e.getStackTrace());
         }
      }
      
      override protected function get effectName() : String
      {
         return §_-93d§.§_-U1F§;
      }
   }
}

