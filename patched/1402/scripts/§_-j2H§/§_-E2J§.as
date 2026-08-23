package §_-j2H§
{
   import Box2D.Dynamics.b2Fixture;
   import Box2D.Dynamics.b2World;
   import §_-8Q§.GameBody;
   import §_-TK§.§_-aS§;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.geom.Point;
   import game.mainGame.entity.§_-f1b§;
   import game.mainGame.entity.§_-w1u§;
   import utils.§_-O1T§;
   
   public class §_-E2J§ extends GameBody implements §_-w1u§
   {
      
      protected var §_-Ty§:§_-aS§ = new §_-aS§();
      
      protected var §_-L2P§:Sprite = new Sprite();
      
      protected var §_-o1b§:int = -1;
      
      protected var §_-11D§:String = "";
      
      public function §_-E2J§()
      {
         super();
         §_-J2J§(this.§_-Ty§);
      }
      
      public function §_-P20§(param1:§_-Y1t§) : void
      {
         this.§_-o1b§ = §_-f1b§.§_-q2W§(param1);
         this.§_-z2z§();
      }
      
      public function get landSound() : String
      {
         var _loc1_:Class = §_-f1b§.§_-N1m§(this.§_-o1b§);
         if(_loc1_ == §_-a1i§)
         {
            return "glass_fall";
         }
         return this.§_-11D§;
      }
      
      override public function build(param1:b2World) : void
      {
         var _loc2_:b2Fixture = this.body.GetFixtureList();
         while(_loc2_)
         {
            if(§_-f1b§.§_-N1m§(this.§_-o1b§) == §_-a1i§)
            {
               _loc2_.SetFriction(0.1);
            }
            _loc2_ = _loc2_.GetNext();
         }
         super.build(param1);
      }
      
      protected function §_-z2z§(param1:int = 0) : void
      {
         if(this.§_-o1b§ == -1)
         {
            return;
         }
         var _loc2_:Class = §_-f1b§.§_-e14§(this.§_-o1b§);
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:BitmapData = §_-O1T§.getBitmapData(new _loc2_());
         this.§_-L2P§.graphics.clear();
         this.§_-L2P§.graphics.beginBitmapFill(_loc3_,null,true,true);
         var _loc4_:Point = this.§_-b1G§();
         var _loc5_:int = Math.ceil((param1 == 0 ? this.width : param1) / 32) * 32;
         this.§_-L2P§.graphics.drawRect(0,0,_loc5_,_loc3_.height - 1);
         this.§_-L2P§.graphics.endFill();
         this.§_-L2P§.x = _loc4_.x;
         this.§_-L2P§.y = _loc4_.y;
         this.§_-Ty§.removeFromParent();
         this.§_-Ty§ = new §_-aS§(this.§_-L2P§,true);
         §_-J2J§(this.§_-Ty§);
      }
      
      protected function §_-b1G§() : Point
      {
         return new Point(0,0);
      }
   }
}

