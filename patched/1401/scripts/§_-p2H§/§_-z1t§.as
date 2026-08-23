package §_-p2H§
{
   import Box2D.Dynamics.b2World;
   import §_-B1O§.§_-O1q§;
   import §_-RI§.§_-d2d§;
   import §_-RI§.§_-h2I§;
   import §_-qJ§.§_-z1C§;
   import game.mainGame.§_-1s§;
   import game.mainGame.§_-jP§;
   import game.mainGame.entity.§_-1j§;
   import game.mainGame.entity.§_-p19§;
   
   public class §_-z1t§ extends §_-Q1c§ implements §_-1j§, §_-jP§, §_-p19§
   {
      
      private var view:§_-d2d§ = null;
      
      private var §_-Q2t§:Boolean = false;
      
      public function §_-z1t§()
      {
         super(null);
         this.view = new §_-d2d§(new Fountain());
         this.view.stop();
         this.view.y = 5;
         §_-83v§(this.view);
      }
      
      override public function build(param1:b2World) : void
      {
         super.build(param1);
         this.view.play();
      }
      
      override public function dispose() : void
      {
         this.view.removeFromParent();
         super.dispose();
      }
      
      public function get waterAuraSize() : int
      {
         return §_-z1C§.§_-BI§;
      }
      
      public function get sideIcon() : §_-h2I§
      {
         return new §_-1s§(§_-1s§.§_-tC§,§_-1s§.§_-b1s§);
      }
      
      public function get showIcon() : Boolean
      {
         return true;
      }
      
      public function get §_-Rc§() : Boolean
      {
         return this.§_-Q2t§;
      }
      
      public function set §_-Rc§(param1:Boolean) : void
      {
         this.§_-Q2t§ = param1;
      }
      
      public function get spotSize() : int
      {
         return §_-O1q§.§_-1t§;
      }
   }
}

