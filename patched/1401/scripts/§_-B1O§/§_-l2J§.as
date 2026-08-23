package §_-B1O§
{
   import Box2D.Dynamics.b2Fixture;
   import Box2D.Dynamics.b2World;
   import §_-83V§.GameBody;
   import §_-RI§.§_-h2I§;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.geom.Point;
   import game.mainGame.entity.§_-03s§;
   import game.mainGame.entity.§_-YY§;
   import utils.§_-93C§;
   
   public class §_-l2J§ extends GameBody implements §_-YY§
   {
      
      protected var §_-E2h§:§_-h2I§ = new §_-h2I§();
      
      protected var §_-N12§:Sprite = new Sprite();
      
      protected var §_-EA§:int = -1;
      
      protected var §_-f2O§:String = "";
      
      public function §_-l2J§()
      {
         super();
         §_-83v§(this.§_-E2h§);
      }
      
      public function §_-sH§(param1:§_-K2R§) : void
      {
         this.§_-EA§ = §_-03s§.§_-X21§(param1);
         this.§_-2N§();
      }
      
      public function get landSound() : String
      {
         var _loc1_:Class = §_-03s§.§_-F1T§(this.§_-EA§);
         if(_loc1_ == §_-z§)
         {
            return "glass_fall";
         }
         return this.§_-f2O§;
      }
      
      override public function build(param1:b2World) : void
      {
         var _loc2_:b2Fixture = this.body.GetFixtureList();
         while(_loc2_)
         {
            if(§_-03s§.§_-F1T§(this.§_-EA§) == §_-z§)
            {
               _loc2_.SetFriction(0.1);
            }
            _loc2_ = _loc2_.GetNext();
         }
         super.build(param1);
      }
      
      protected function §_-2N§(param1:int = 0) : void
      {
         if(this.§_-EA§ == -1)
         {
            return;
         }
         var _loc2_:Class = §_-03s§.§_-81e§(this.§_-EA§);
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:BitmapData = §_-93C§.getBitmapData(new _loc2_());
         this.§_-N12§.graphics.clear();
         this.§_-N12§.graphics.beginBitmapFill(_loc3_,null,true,true);
         var _loc4_:Point = this.§_-jG§();
         var _loc5_:int = Math.ceil((param1 == 0 ? this.width : param1) / 32) * 32;
         this.§_-N12§.graphics.drawRect(0,0,_loc5_,_loc3_.height - 1);
         this.§_-N12§.graphics.endFill();
         this.§_-N12§.x = _loc4_.x;
         this.§_-N12§.y = _loc4_.y;
         this.§_-E2h§.removeFromParent();
         this.§_-E2h§ = new §_-h2I§(this.§_-N12§,true);
         §_-83v§(this.§_-E2h§);
      }
      
      protected function §_-jG§() : Point
      {
         return new Point(0,0);
      }
   }
}

