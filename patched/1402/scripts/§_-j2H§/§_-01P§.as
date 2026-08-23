package §_-j2H§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-TK§.§_-f1u§;
   
   public class §_-01P§ extends §_-d6§
   {
      
      private var §_-32E§:§_-f1u§ = new §_-f1u§(new ButtonScriptUp());
      
      private var §_-011§:Boolean = false;
      
      public function §_-01P§()
      {
         super();
         this.§_-32E§.y = -10;
         §_-J2J§(this.§_-32E§);
         this.contactsCount = 0;
         this.size = new b2Vec2();
         this.visible = true;
         this.§_-M5§ = true;
         this.§_-32E§.loop = false;
         this.§_-32E§.stop();
      }
      
      override public function set showDebug(param1:Boolean) : void
      {
         super.showDebug = param1;
         this.visible = true;
      }
      
      override public function set size(param1:b2Vec2) : void
      {
         if(!param1)
         {
         }
         super.size = new b2Vec2(4.4,1.6);
      }
      
      override public function get contactsCount() : int
      {
         return super.contactsCount;
      }
      
      override public function set contactsCount(param1:int) : void
      {
         super.contactsCount = param1;
         this.down = this.contactsCount > 0;
      }
      
      public function get down() : Boolean
      {
         return this.§_-011§;
      }
      
      override protected function draw() : void
      {
      }
      
      public function set down(param1:Boolean) : void
      {
         if(this.§_-011§ == param1)
         {
            return;
         }
         this.§_-011§ = param1;
         if(param1)
         {
            this.§_-32E§.§_-W2R§(0,10);
         }
         else
         {
            this.§_-32E§.§_-W2R§(11,21);
         }
      }
   }
}

