package §_-k1z§
{
   import Box2D.Dynamics.b2World;
   import §_-921§.§_-x1c§;
   import §_-TK§.§_-aS§;
   import §_-TK§.§_-f1u§;
   import §_-j2H§.§_-D1T§;
   import game.mainGame.§_-D1m§;
   import game.mainGame.§_-jC§;
   import game.mainGame.entity.§_-636§;
   import game.mainGame.entity.§_-p2r§;
   
   public class §_-p1J§ extends §_-bh§ implements §_-636§, §_-jC§, §_-p2r§
   {
      
      private var view:§_-f1u§ = null;
      
      private var §_-Z2g§:Boolean = false;
      
      public function §_-p1J§()
      {
         super(null);
         this.view = new §_-f1u§(new Fountain());
         this.view.stop();
         this.view.y = 5;
         §_-J2J§(this.view);
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
         return §_-x1c§.§_-At§;
      }
      
      public function get sideIcon() : §_-aS§
      {
         return new §_-D1m§(§_-D1m§.§_-kY§,§_-D1m§.§_-mw§);
      }
      
      public function get showIcon() : Boolean
      {
         return true;
      }
      
      public function get §_-P2t§() : Boolean
      {
         return this.§_-Z2g§;
      }
      
      public function set §_-P2t§(param1:Boolean) : void
      {
         this.§_-Z2g§ = param1;
      }
      
      public function get spotSize() : int
      {
         return §_-D1T§.§_-P25§;
      }
   }
}

